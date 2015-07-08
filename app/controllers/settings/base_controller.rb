module Settings
  class BaseController < ApplicationController
    before_action :find_restaurant
    helper_method :total_spots
    helper_method :total_seats

    protected

    def find_restaurant
      @restaurant = current_user.restaurants.find(params[:restaurant_id])
    end

    def total_spots
      @restaurant.spots.count
    end

    def total_seats
      @restaurant.spots.sum(:capacity)
    end

  end
end
