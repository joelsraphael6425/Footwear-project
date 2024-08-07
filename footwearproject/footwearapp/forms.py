from django import forms
from .models import Footwear

class FootwearForm(forms.ModelForm):
    class Meta:
        model = Footwear
        fields = ['company_name', 'image', 'price', 'color', 'model', 'size', 'name', 'quantity']
