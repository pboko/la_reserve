class WaitersController < ApplicationController

  before_action :find_waiter, only: [:show, :edit, :update, :destroy]
  before_action :find_restaurant, only: [:new, :create]

  def index
    @waiters = Waiter.all
  end

  def show
  end

  def new
    @waiter = Waiter.new
  end

  def create
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

  def find_waiter
    @waiter = Waiter.find(params[:id])
  end

  def find_restaurant
    @restaurant = Restaurant.find(params[:restaurant_id])
  end

  def waiter_params
    params.require(:waiter).permit(:name)
  end


end
