from django.urls import path
from . import views

urlpatterns = [
    path('', views.footwear_list, name='footwear_list'),
    path('add/', views.add_footwear, name='add_footwear'),
    path('sell/<int:pk>/', views.sell_footwear, name='sell_footwear'),
    path('edit/<int:pk>/', views.edit_footwear, name='edit_footwear'),  # Add this line
    path('delete/<int:pk>/', views.delete_footwear, name='delete_footwear'),  # Add this line
    path('update_quantity/<int:footwear_id>/', views.update_quantity, name='update_quantity'),
]
