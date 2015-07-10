class StatsController < ApplicationController

  def show
    @restaurant = current_user.restaurants.find(params[:restaurant_id])
    @start_date = parse_date :start_date
    @end_date = parse_date :end_date

    @bookings = @restaurant.bookings.where(date: (@start_date..@end_date))


    @lunch_stats = @bookings.where(period: "Midi").where(waiting_list: false).sum(:pax)
    @diner_stats = @bookings.where(period: "Soir").where(waiting_list: false).sum(:pax)
    @total_stats = @lunch_stats + @diner_stats

  end

  private

  def parse_date(key)
    params[key].blank? ? Date.today : Date.strptime(params[key], "%Y-%m-%d")
  end
end
