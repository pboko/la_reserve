class BookingsController < ApplicationController

  before_action :find_restaurant
  before_action :find_booking, only: [:show, :edit, :update, :destroy]

  def index

    if params[:date]
      @date = Date.parse(params[:date])
    else
      @date = Date.today
    end

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
    @booking = Booking.new
  end

  def create
    @booking = @restaurant.bookings.build(booking_params)
    customer = @restaurant.customers.where(last_name: params[:last_name]).first_or_create do |customer|
      customer.email        = params[:email]        if params[:email].present?
      customer.first_name   = params[:first_name]   if params[:first_name].present?
      customer.phone_number = params[:phone_number] if params[:phone_number].present?
    end

    @booking.start_time = DateTime.strptime(params[:start_time], "%Hh%M")
    @booking.customer   = customer

    if @booking.save
      redirect_to restaurant_bookings_path(@restaurant)
    else
      raise
      render :new
    end
  end

  def edit
  end

  def update
    customer = @restaurant.customers.where(last_name: params[:last_name]).first_or_create

    @booking.customer = customer

    if @booking.update(booking_params)
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

end
