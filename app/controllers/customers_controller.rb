require 'csv'

class CustomersController < ApplicationController
  before_action :find_customer, only: [:show, :edit, :update]
  before_action :find_restaurant

  def index
    @restaurant = Restaurant.find(params[:restaurant_id])
    @customers = @restaurant.customers.order("last_name, first_name")
    respond_to do |format|
      format.html
      format.csv do
        headers['Content-Disposition'] = "attachment; filename=\"liste_clients\""
        headers['Content-Type'] ||= 'text/csv'
      end
    end
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

  #def load_customer_csv
    #CSV.foreach(csv_file, headers: :first_row, header_converters: :symbol) do |row|
      #customer << Customer.new((row[:id]), row[:first_name], row[:last_name], row[:email])
    #end
  #end

  #def write_customer_csv
    #CSV.open(csv_file, "w") do |csv|
      #csv << ["id", "first_name", "last_name", "email"]
      #customers.each do |customer|
        #csv << [customer.id, customer.first_name, customer.last_name, customer.email]
      #end
    #end
  #end
end
