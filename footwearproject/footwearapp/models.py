from django.db import models
from django.utils import timezone
from django.core.exceptions import ValidationError

class Footwear(models.Model):
    company_name = models.CharField(max_length=100)
    image = models.ImageField(upload_to='footwear_images/')
    price = models.DecimalField(max_digits=10, decimal_places=2)
    color = models.CharField(max_length=30)
    model = models.CharField(max_length=50)
    size = models.CharField(max_length=10)
    name = models.CharField(max_length=100)
    quantity = models.IntegerField()

    def __str__(self):
        return f"{self.name} ({self.model}) - ${self.price}"


    def sell(self, quantity_sold):
        if quantity_sold > self.quantity:
            raise ValidationError("Not enough stock available.")
        self.quantity -= quantity_sold
        self.save()

    def restock(self, quantity_added):
        if quantity_added < 0:
            raise ValidationError("Restock quantity cannot be negative.")
        self.quantity += quantity_added
        self.save()

class Customer(models.Model):
    name = models.CharField(max_length=100)
    email = models.EmailField(null=True, blank=True)
    phone = models.CharField(max_length=15, null=True, blank=True)

    def __str__(self):
        return self.name

class Bill(models.Model):
    customer = models.ForeignKey(Customer, on_delete=models.CASCADE)
    bill_code = models.CharField(max_length=10, unique=True)
    date = models.DateField(default=timezone.now)
    time = models.TimeField(default=timezone.now)
    total_amount = models.DecimalField(max_digits=10, decimal_places=2)
    gst_amount = models.DecimalField(max_digits=10, decimal_places=2)
    grand_total = models.DecimalField(max_digits=10, decimal_places=2)

    def __str__(self):
        return f"Bill {self.bill_code} for {self.customer.name}"

    class Meta:
        ordering = ['-date', '-time']



class BillItem(models.Model):
    bill = models.ForeignKey(Bill, related_name='items', on_delete=models.CASCADE)
    footwear = models.ForeignKey(Footwear, on_delete=models.CASCADE)
    quantity = models.IntegerField()
    price = models.DecimalField(max_digits=10, decimal_places=2)
    total_price = models.DecimalField(max_digits=10, decimal_places=2)

    def __str__(self):
        return f"{self.quantity} x {self.footwear.name} in Bill {self.bill.bill_code}"

    class Meta:
        ordering = ['footwear__name']


from django.db import models
from django.contrib.auth.hashers import make_password

class CustomUser(models.Model):
    username = models.CharField(max_length=150, unique=True)
    email = models.EmailField(unique=True)
    password = models.CharField(max_length=128)
    first_name = models.CharField(max_length=30, blank=True)
    last_name = models.CharField(max_length=30, blank=True)

    def save(self, *args, **kwargs):
        # Hash the password before saving
        self.password = make_password(self.password)
        super().save(*args, **kwargs)

    def __str__(self):
        return self.username


from django.db import models
from django.utils import timezone

class OTPCode(models.Model):
    user = models.ForeignKey(CustomUser, on_delete=models.CASCADE)
    code = models.CharField(max_length=6)
    created_at = models.DateTimeField(default=timezone.now)
