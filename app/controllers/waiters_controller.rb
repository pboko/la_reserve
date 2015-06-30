class WaitersController < ApplicationController

  before_action :set_waiter, only: [:show, :edit, :update, :destroy]

  def index
    @waiters = Waiter.all
  end

  def show
    @waiter = Waiter.find(params[:id])
  end

  def new
    @restaurant = Restaurant.find(params[:restaurant_id])
    @waiter = Waiter.new
  end

  def create
    @restaurant = Restaurant.find(params[:restaurant_id])
    @waiter = @restaurant.waiters.build(waiter_params)
    @waiter.save
    redirect_to restaurant_waiters_path(@restaurant)
  end

  def edit
  end

  def update
    if @waiter.update(waiter_params)
      redirect_to restaurant_waiter_path(@waiter)
    else
      render :edit
    end
  end

  def destroy
    @waiter.destroy
    redirect_to restaurant_waiters_path(@waiter.restaurant)
  end

  private

  def set_waiter
    @waiter = Waiter.find(params[:id])
  end

  def waiter_params
    params.require(:waiter).permit(:name)
  end


end
