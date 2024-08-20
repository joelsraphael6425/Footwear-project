from django.contrib import admin

# Register your models here.
# admin.py

from django.contrib import admin
from .models import Footwear, Customer, Bill, BillItem,CustomUser

admin.site.register(Footwear)
admin.site.register(Customer)
admin.site.register(Bill)
admin.site.register(BillItem)
admin.site.register(CustomUser)
