class SpotsController < ApplicationController

  before_action :find_spot, only: [:show, :edit, :update, :destroy]
  before_action :find_restaurant, only: [:new, :create, :index]

  def index
    @spots = Spot.all
  end

  def show
  end

  def new
    @spot = Spot.new
  end

  def create
    @spot = @restaurant.spots.build(spot_params)
    @spot.save
    redirect_to restaurant_spots_path(@restaurant)
  end

  def edit
  end

  def update
    if @spot.update(spot_params)
      redirect_to restaurant_spot_path(@spot)
    else
      render :edit
    end
  end

  def destroy
    @spot.destroy
    redirect_to restaurant_spots_path(@spot.restaurant)
  end

  private

  def find_spot
    @spot = Spot.find(params[:id])
  end

  def find_restaurant
    @restaurant = Restaurant.find(params[:restaurant_id])
  end

  def spot_params
    params.require(:spot).permit(:name, :capacity)
  end

end
