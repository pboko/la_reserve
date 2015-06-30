class SpotsController < ApplicationController

  before_action :find_spot, only: [:show, :edit, :update, :destroy]

  def index
    @spots = Spot.all
  end

  def show
    @spot = Spot.find(params[:id])
  end

  def new
    @restaurant = Restaurant.find(params[:restaurant_id])
    @spot = Spot.new
  end

  def create
    @restaurant = Restaurant.find(params[:restaurant_id])
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

  def spot_params
    params.require(:spot).permit(:name, :capacity)
  end

end
