class CustomersController < ApplicationController
  before_action :find_customer, only: [:show, :edit, :update]

  def index
    @customers = Customer.all
  end

  def show
    @customers = Customer.all
  end

  def new
    @customer = Customer.new
  end

  def create
    @customer = Customer.new(customer_params)
    @customer.save
    redirect_to customer_path(@customer)
  end

  def edit
  end

  def update
    @customer.update(customer_params)
    redirect_to customer_path(@customer)
  end

  private

  def find_customer
    @customer = Customer.find(params[:id])
  end

  def customer_params
    params.require(:customer).permit(:first_name, :last_name, :email, :phone_number, :vip, :status, :gender, :comments)
  end
end
