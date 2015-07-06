class SettingsController < ApplicationController

  before_action :find_restaurant
  before_action :find_setting, only [:edit, :update]

  def index
    @settings = Setting.all
  end

  def edit
  end

  def update
    @setting = Setting.find(parmas[:id])
    if @setting.update(setting_params)
      redirect_to restaurant_settings_path(@restaurant)
    else
      render :edit
    end
  end

  private

  def find_restaurant
    @restaurant = Restaurant.find(params[:restaurant_id])
  end

  def find_settings
    @setting = Setting.find(params[:restaurant_id])
  end

  #def setting_params
    #params.require(:setting).permit(:restaurant_name, :restaurant_street, :restaurant_city, :restaurant_zipcode, :restaurant_country, :lunch_capacity, :diner_capacity, ::status, :period, :pax, :notes)
  #end

end
