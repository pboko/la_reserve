class StatsController < ApplicationController

  def show
    @restaurant = current_user.restaurants.find(params[:restaurant_id])
    @start_date = params[:start_date] || Date.today
    @end_date = params[:end_date] || Date.today

    @bookings = @restaurant.bookings.where(date: (@start_date..@end_date))

    @lunch_stats = @bookings.where(period: "Midi").sum(:pax)
    @diner_stats = @bookings.where(period: "Soir").sum(:pax)
    @total_stats = @lunch_stats + @diner_stats

  end
end
