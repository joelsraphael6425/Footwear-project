# Generated by Django 5.0.7 on 2024-08-02 04:27

from django.db import migrations, models


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='Footwear',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('company_name', models.CharField(max_length=100)),
                ('image', models.ImageField(upload_to='footwear_images/')),
                ('price', models.DecimalField(decimal_places=2, max_digits=10)),
                ('color', models.CharField(max_length=30)),
                ('model', models.CharField(max_length=50)),
                ('size', models.CharField(max_length=10)),
                ('name', models.CharField(max_length=100)),
                ('quantity', models.IntegerField()),
            ],
        ),
    ]
