class BookingsController < ApplicationController

  before_action :find_restaurant, only: [:index, :show, :new, :create, :edit, :update, :destroy]
  before_action :find_booking, only: [:show, :edit, :update, :destroy]

  def index
    @bookings = @restaurant.bookings
    if params[:date]
      @date = Date.parse(params[:date])
    else
      @date = Date.today
    end
  end

  def show
  end

  def new
    @booking = Booking.new
  end

  def create
    @booking = @restaurant.bookings.build(booking_params)
    if @booking.save
      redirect_to restaurant_bookings_path(@booking)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @booking.update(restaurant_params)
      redirect_to restaurant_path(@restaurant)
    else
      render :edit
    end
  end

  def destroy
    @booking = Booking.find(params[:id])
    @booking.destroy
    redirect_to restaurant_bookings_path
  end

  private

  def find_restaurant
    @restaurant = Restaurant.find(params[:restaurant_id])
  end

  def booking_params
    params.require(:booking).permit(:start_time, :end_time, :date, :pax)
  end

  def find_booking
  @booking = Booking.find(params[:id])
  end
end
