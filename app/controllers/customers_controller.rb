class CustomersController < ApplicationController
  before_action :find_customer, only: [:show, :edit, :update]
  before_action :find_restaurant
  skip_after_action :verify_policy_scoped
  def index
    @restaurant = Restaurant.find(params[:restaurant_id])
    @customers = @restaurant.customers.order("last_name, first_name")
  end

  def show
  end

  def new
    @customer = Customer.new
  end

  def create
    @customer = Customer.create(customer_params)
    @customer.save
    @customer_restaurant = RestaurantCustomer.new({restaurant: @restaurant, customer: @customer})
    @customer_restaurant.save
    redirect_to restaurant_customers_path(@restaurant)

  end

  def edit
  end

  def update
    @customer.update(customer_params)
    redirect_to restaurant_customers_path(@restaurant)
  end

  private

  def find_customer
    @customer = Customer.find(params[:id])
  end

  def find_restaurant
    @restaurant = Restaurant.find(params[:restaurant_id])
  end

  def customer_params
    params.require(:customer).permit(:first_name, :last_name, :email, :phone_number, :vip, :status, :gender, :comments)
  end
end
