# Generated by Django 5.0.2 on 2024-08-15 10:03

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('footwearapp', '0008_alter_footwear_size'),
    ]

    operations = [
        migrations.AlterField(
            model_name='footwear',
            name='size',
            field=models.CharField(max_length=10),
        ),
    ]
