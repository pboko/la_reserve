class BookingsController < ApplicationController
  before_action :find_restaurant
  before_action :find_booking,              only: [:show, :edit, :update, :destroy]
  before_action :update_or_create_customer, only: [:create, :update]

  def index
    @time = params[:time]
    # on instancie le params time
    @bookings = @restaurant.bookings.order(:start_time)

    @diner_booking_total = total_cuttlery(:soir, @bookings)
    @lunch_booking_total = total_cuttlery(:midi, @bookings)

    respond_to do |format|
      format.html
      format.js
    end
  end

  def show
  end

  def new
    @booking = Booking.new_for_evening(@date)
  end

  def create
    @booking            = @restaurant.bookings.build(booking_params)
    @booking.start_time = DateTime.strptime(params[:start_time], "%Hh%M")
    @booking.customer   = @customer

    if @booking.save
      redirect_to restaurant_bookings_path(@restaurant)
    else
      render :new
    end
  end

  def widget
    @booking            = @restaurant.bookings.build(booking_params)
    @booking.start_time = DateTime.strptime(params[:start_time], "%Hh%M")
    @booking.customer   = @customer
  end

  def edit
  end

  def update
    @booking.assign_attributes(booking_params)

    @booking.customer   = @customer
    @booking.start_time = DateTime.strptime(params[:start_time], "%Hh%M")

    if @booking.save
      redirect_to restaurant_bookings_path(@restaurant)
    else
      render :edit
    end
  end

  def destroy
    @booking.destroy
    redirect_to restaurant_bookings_path
  end

  private

  def total_cuttlery(period, bookings)
    count = 0
    # count_wait = 0
    bookings.for_period(period).for_date(@date).each do |booking|
      count += booking.pax unless booking.waiting_list?
    end
    return count
  end

  def find_restaurant
    @restaurant = Restaurant.find(params[:restaurant_id])
  end

  def booking_params
    params.require(:booking).permit(:date, :status, :period, :pax, :notes, :waiting_list)
  end

  def find_booking
    @booking = Booking.find(params[:id])
  end

  def update_or_create_customer
    customer_params = params.require(:customer).permit(:email, :first_name, :last_name, :phone_number)
    last_name       = customer_params.delete(:last_name)
    @customer       = @restaurant.customers.where(last_name: last_name).first_or_create

    @customer.update(customer_params)
  end
end
