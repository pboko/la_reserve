class BookingsController < ApplicationController

  before_action :find_restaurant
  before_action :find_booking, only: [:show, :edit, :update, :destroy]

  def index

    if params[:date]
      @date = Date.parse(params[:date])
    else
      @date = Date.today
    end

    @bookings = @restaurant.bookings
    @diner_booking_total = total_cuttlery(:soir, @bookings)
    @lunch_booking_total = total_cuttlery(:midi, @bookings)

  end

  def show
  end

  def new
    @booking = Booking.new
  end

  def create
    @booking = @restaurant.bookings.build(booking_params)
    if @booking.save
      redirect_to restaurant_bookings_path(@restaurant)
    else
      render :new
    end
  end

  def edit
  end

  def update
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
    bookings.for_period(period).for_date(Date.today).each do |booking|
      count += booking.pax
    end
    return count
  end

  def find_restaurant
    @restaurant = Restaurant.find(params[:restaurant_id])
  end

  def booking_params
    params.require(:booking).permit(:start_time, :end_time, :date, :status, :period, :pax, :notes)
  end

  def find_booking
  @booking = Booking.find(params[:id])
  end

end
