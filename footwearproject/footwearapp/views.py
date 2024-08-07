from django.shortcuts import render, get_object_or_404, redirect
from django.views.decorators.http import require_POST
from .models import Footwear
from .forms import FootwearForm
from django.shortcuts import render, get_object_or_404, redirect
from .models import Footwear
from .forms import FootwearForm



# View to add new footwear
def add_footwear(request):
    if request.method == 'POST':
        form = FootwearForm(request.POST, request.FILES)
        if form.is_valid():
            form.save()
            return redirect('footwear_list')
    else:
        form = FootwearForm()
    return render(request, 'add_footwear.html', {'form': form})

# View to list all footwear
def footwear_list(request):
    footwears = Footwear.objects.all()
    for footwear in footwears:
        footwear.total_value = footwear.price * footwear.quantity
    return render(request, 'footwear_list.html', {'footwears': footwears})

# View to handle selling of footwear
def sell_footwear(request, pk):
    footwear = get_object_or_404(Footwear, pk=pk)
    if request.method == 'POST':
        quantity_sold = int(request.POST.get('quantity_sold', 0))
        if quantity_sold > 0 and quantity_sold <= footwear.quantity:
            footwear.quantity -= quantity_sold
            footwear.save()
            return redirect('footwear_list')
    return render(request, 'sell_footwear.html', {'footwear': footwear})

# View to update the quantity of footwear directly
@require_POST
def update_quantity(request, footwear_id):
    footwear = get_object_or_404(Footwear, id=footwear_id)
    new_quantity = int(request.POST.get('quantity', 0))
    if new_quantity >= 0:
        footwear.quantity = new_quantity
        footwear.save()
    return redirect('footwear_list')




def edit_footwear(request, pk):
    footwear = get_object_or_404(Footwear, pk=pk)
    if request.method == 'POST':
        form = FootwearForm(request.POST, request.FILES, instance=footwear)
        if form.is_valid():
            form.save()
            return redirect('footwear_list')
    else:
        form = FootwearForm(instance=footwear)
    return render(request, 'edit_footwear.html', {'form': form, 'footwear': footwear})

def delete_footwear(request, pk):
    footwear = get_object_or_404(Footwear, pk=pk)
    if request.method == 'POST':
        footwear.delete()
        return redirect('footwear_list')
    return render(request, 'delete_footwear.html', {'footwear': footwear})
