from django.db import models

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
        return self.name

    def sell(self, quantity_sold):
        self.quantity -= quantity_sold
        self.save()
