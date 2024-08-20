from django.urls import path
from . import views
from .views import BillListView
urlpatterns = [
    path('', views.index, name='index'), 
    path('foot/', views.footwear_list, name='footwear_list'),
    path('add/', views.add_footwear, name='add_footwear'),
    path('sell/<int:pk>/', views.sell_footwear, name='sell_footwear'),
    path('edit/<int:pk>/', views.edit_footwear, name='edit_footwear'),
    path('delete/<int:pk>/', views.delete_footwear, name='delete_footwear'),
    path('update_quantity/<int:footwear_id>/', views.update_quantity, name='update_quantity'),
    path('create_bill/', views.create_bill, name='create_bill'),
    path('bill/<int:bill_id>/', views.view_bill, name='view_bill'),
    path('bills/', views.list_bills, name='list_bills'),
    path('bills/delete/<int:pk>/', views.delete_bill, name='delete_bill'),
    path('signup/', views.signup, name='signup'),
    path('signin/', views.signin, name='signin'),
    path('logout/', views.logout_view, name='logout'),
    path('verify-otp/', views.verify_otp, name='verify_otp'),  # Added path for OTP verification
    path('bills/', BillListView.as_view(), name='list_bills'),

]
