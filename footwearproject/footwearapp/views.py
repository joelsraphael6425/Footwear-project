from django.shortcuts import render, get_object_or_404, redirect
from django.views.decorators.http import require_POST
from django.http import HttpResponseBadRequest, JsonResponse
from django.utils.crypto import get_random_string
from django.utils import timezone
from django.contrib.auth import logout
from django.contrib.auth.hashers import check_password
from functools import wraps
from django.core.mail import send_mail
from django.conf import settings
from datetime import timedelta, datetime
import random
import string
import json
from .models import CustomUser, Footwear, Customer, Bill, BillItem, OTPCode
from .forms import FootwearForm

def generate_otp():
    return ''.join(random.choices(string.ascii_uppercase + string.digits, k=6))

def login_required(view_func):
    @wraps(view_func)
    def _wrapped_view(request, *args, **kwargs):
        if not request.session.get('user_id'):
            return redirect('signin')  # Redirect to the signin page if not logged in
        return view_func(request, *args, **kwargs)
    return _wrapped_view

def index(request):
    return render(request, 'index.html')

def signup(request):
    if request.method == 'POST':
        username = request.POST['username']
        email = request.POST['email']
        password = request.POST['password']
        password_confirm = request.POST['password_confirm']
        first_name = request.POST['first_name']
        last_name = request.POST['last_name']

        # Check if passwords match
        if password != password_confirm:
            return JsonResponse({'error': 'Passwords do not match'})

        # Check if the username or email already exists
        if CustomUser.objects.filter(username=username).exists() or CustomUser.objects.filter(email=email).exists():
            return JsonResponse({'exists': True})

        # Generate and send OTP
        otp_code = generate_otp()
        send_mail(
            'Your OTP Code',
            f'Your OTP code is {otp_code}',
            settings.DEFAULT_FROM_EMAIL,
            [email],
            fail_silently=False,
        )

        # Store user data temporarily in the session
        request.session['signup_data'] = {
            'username': username,
            'email': email,
            'password': password,
            'first_name': first_name,
            'last_name': last_name,
        }
        request.session['otp_code'] = otp_code  # Store OTP in the session

        return JsonResponse({'exists': False, 'otp_sent': True})

    return render(request, 'signup.html')

def verify_otp(request):
    if request.method == 'POST':
        email = request.POST['email']
        otp_code = request.POST['otp_code']

        # Retrieve the OTP code and user data from the session
        session_otp_code = request.session.get('otp_code')
        signup_data = request.session.get('signup_data')

        if session_otp_code is None or signup_data is None:
            return JsonResponse({'verified': False, 'error': 'Session expired. Please try signing up again.'})

        if email != signup_data['email']:
            return JsonResponse({'verified': False, 'error': 'Email does not match.'})

        # Check if the OTP is correct
        if otp_code != session_otp_code:
            return JsonResponse({'verified': False, 'error': 'Invalid OTP.'})

        # Check if the OTP has expired (e.g., after 1 minute)
        otp_created_at = OTPCode.objects.filter(user__email=email, code=session_otp_code).first()
        if otp_created_at and datetime.now() - otp_created_at.created_at > timedelta(minutes=1):
            return JsonResponse({'verified': False, 'error': 'OTP has expired'})

        # Save user data after successful OTP verification
        user = CustomUser(
            username=signup_data['username'],
            email=signup_data['email'],
            password=signup_data['password'],
            first_name=signup_data['first_name'],
            last_name=signup_data['last_name'],
        )
        user.save()

        # Log in the user
        request.session['user_id'] = user.id

        # Clear session data
        del request.session['signup_data']
        del request.session['otp_code']

        # Redirect to the footwear list page
        return JsonResponse({'verified': True})

    return render(request, 'verify_otp.html')

def signin(request):
    if request.method == 'POST':
        username_or_email = request.POST.get('username_or_email')
        password = request.POST.get('password')

        try:
            user = CustomUser.objects.get(username=username_or_email)  # Check if username
        except CustomUser.DoesNotExist:
            try:
                user = CustomUser.objects.get(email=username_or_email)  # Check if email
            except CustomUser.DoesNotExist:
                return JsonResponse({'error': 'Invalid username or email or password'})

        if check_password(password, user.password):
            # Login successful
            request.session['user_id'] = user.id
            return JsonResponse({'success': True})
        else:
            return JsonResponse({'error': 'Invalid username or email or password'})

    return render(request, 'signin.html')

@login_required
def add_footwear(request):
    if request.method == 'POST':
        form = FootwearForm(request.POST, request.FILES)
        if form.is_valid():
            form.save()
            return redirect('footwear_list')
    else:
        form = FootwearForm()

    # Get the username from the session
    user_id = request.session.get('user_id')
    username = None
    if user_id:
        try:
            user = CustomUser.objects.get(id=user_id)
            username = user.username
        except CustomUser.DoesNotExist:
            pass  # Handle the case where the user does not exist

    return render(request, 'add_footwear.html', {'form': form, 'username': username})


@login_required
def footwear_list(request):
    footwears = Footwear.objects.all()
    for footwear in footwears:
        footwear.total_value = footwear.price * footwear.quantity

    # Get the username from the session
    user_id = request.session.get('user_id')
    username = None
    if user_id:
        try:
            user = CustomUser.objects.get(id=user_id)
            username = user.username
        except CustomUser.DoesNotExist:
            pass  # Handle the case where the user does not exist

    return render(request, 'footwear_list.html', {'footwears': footwears, 'username': username})

@login_required
def sell_footwear(request, pk):
    footwear = get_object_or_404(Footwear, pk=pk)
    if request.method == 'POST':
        quantity_sold = int(request.POST.get('quantity_sold', 0))
        if quantity_sold > 0 and quantity_sold <= footwear.quantity:
            footwear.quantity -= quantity_sold
            footwear.save()
            return redirect('footwear_list')
        else:
            return HttpResponseBadRequest("Invalid quantity.")
    return render(request, 'sell_footwear.html', {'footwear': footwear})

@login_required
@require_POST
def update_quantity(request, footwear_id):
    footwear = get_object_or_404(Footwear, id=footwear_id)
    new_quantity = int(request.POST.get('quantity', 0))
    if new_quantity >= 0:
        footwear.quantity = new_quantity
        footwear.save()
    return redirect('footwear_list')

@login_required
def edit_footwear(request, pk):
    footwear = get_object_or_404(Footwear, pk=pk)
    if request.method == 'POST':
        form = FootwearForm(request.POST, instance=footwear)
        if form.is_valid():
            form.save()
            return redirect('footwear_list')
    else:
        form = FootwearForm(instance=footwear)
    return render(request, 'edit_footwear.html', {'form': form})

@login_required
def delete_footwear(request, pk):
    footwear = get_object_or_404(Footwear, pk=pk)
    if request.method == 'POST':
        footwear.delete()
        return redirect('footwear_list')
    return render(request, 'delete_footwear.html', {'footwear': footwear})

from django.shortcuts import render, get_object_or_404, redirect
from django.http import HttpResponseBadRequest
from django.utils import timezone
from django.utils.crypto import get_random_string
import json
from .models import Customer, Footwear, Bill, BillItem

def create_bill(request):
    if request.method == 'POST':
        customer_name = request.POST.get('customer_name')
        customer_email = request.POST.get('customer_email')
        customer_phone = request.POST.get('customer_phone')
        selected_products = json.loads(request.POST.get('selected_products', '[]'))
        gst_percentage = float(request.POST.get('gst', 0))  # Get GST percentage from form
        apply_gst = request.POST.get('apply_gst') == 'on'  # Check if GST should be applied

        if not (customer_name and customer_phone):
            return HttpResponseBadRequest("Customer name and phone are required.")

        customer, created = Customer.objects.get_or_create(
            name=customer_name, email=customer_email, phone=customer_phone
        )

        bill_code = get_random_string(10).upper()
        total_amount = 0
        bill_items = []

        for product in selected_products:
            footwear_id = product['id']
            quantity = int(product['quantity'])
            total_price = float(product['total'])

            footwear = get_object_or_404(Footwear, id=footwear_id)
            if quantity > footwear.quantity:
                return HttpResponseBadRequest(f"Not enough stock for {footwear.name}.")

            total_amount += total_price

            footwear.quantity -= quantity
            footwear.save()

            bill_items.append({
                'footwear': footwear,
                'quantity': quantity,
                'price': footwear.price,
                'total_price': total_price
            })

        gst_amount = (total_amount * gst_percentage) / 100 if apply_gst else 0
        grand_total = total_amount + gst_amount

        bill = Bill.objects.create(
            customer=customer,
            bill_code=bill_code,
            total_amount=total_amount,
            gst_amount=gst_amount,
            grand_total=grand_total,
            date=timezone.now().date(),
            time=timezone.now().time()
        )

        for item in bill_items:
            BillItem.objects.create(
                bill=bill,
                footwear=item['footwear'],
                quantity=item['quantity'],
                price=item['price'],
                total_price=item['total_price']
            )

        return redirect('view_bill', bill_id=bill.id)

    footwears = Footwear.objects.all()
    return render(request, 'create_bill.html', {'footwears': footwears})


@login_required
def view_bill(request, bill_id):
    bill = get_object_or_404(Bill, id=bill_id)
    return render(request, 'view_bill.html', {'bill': bill})

from django.core.paginator import Paginator
from django.shortcuts import render

def list_bills(request):
    bills_list = Bill.objects.all().order_by('-date', '-time')  # Latest bills first
    paginator = Paginator(bills_list, 10)  # Show 10 bills per page

    page_number = request.GET.get('page')
    page_obj = paginator.get_page(page_number)

    return render(request, 'list_bills.html', {'page_obj': page_obj})

from django.views.generic import ListView
from .models import Bill

class BillListView(ListView):
    model = Bill
    template_name = 'list_bills.html'
    context_object_name = 'page_obj'
    ordering = ['-date', '-time']  # Latest bills first
    paginate_by = 10  # Show 10 bills per page


@login_required
def delete_bill(request, pk):
    bill = get_object_or_404(Bill, pk=pk)
    bill.delete()
    return redirect('list_bills')

@login_required
def logout_view(request):
    request.session.flush()  # Clears the session data
    return redirect('signin')
