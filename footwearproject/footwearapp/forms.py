from django import forms
from .models import Footwear

class FootwearForm(forms.ModelForm):
    class Meta:
        model = Footwear
        fields = ['company_name', 'image', 'price', 'color', 'model', 'size', 'name', 'quantity']
        widgets = {
            'company_name': forms.TextInput(attrs={
                'class': 'form-control',
                'style': 'max-width: 150px; margin-bottom: 10px; padding: 3px; height: 30px;'
            }),
            'price': forms.NumberInput(attrs={
                'class': 'form-control',
                'style': 'max-width: 80px; margin-bottom: 10px; padding: 3px; height: 30px;'
            }),
            'color': forms.TextInput(attrs={
                'class': 'form-control',
                'style': 'max-width: 100px; margin-bottom: 10px; padding: 3px; height: 30px;'
            }),
            'model': forms.TextInput(attrs={
                'class': 'form-control',
                'style': 'max-width: 150px; margin-bottom: 10px; padding: 3px; height: 30px;'
            }),
            'size': forms.TextInput(attrs={
                'class': 'form-control',
                'style': 'max-width: 80px; margin-bottom: 10px; padding: 3px; height: 30px;'
            }),
            'name': forms.TextInput(attrs={
                'class': 'form-control',
                'style': 'max-width: 100px; margin-bottom: 10px; padding: 3px; height: 30px;'
            }),
            'quantity': forms.NumberInput(attrs={
                'class': 'form-control',
                'style': 'max-width: 80px; margin-bottom: 10px; padding: 3px; height: 30px;'
            }),
            'image': forms.ClearableFileInput(attrs={
                'class': 'form-control-file',
                'style': 'max-width: 150px; margin-bottom: 10px; padding: 3px; height: 30px;'
            }),
        }
