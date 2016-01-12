class SettingsController < Settings::BaseController
  def edit
  end

  def update
    if @restaurant.update(restaurant_params)
      redirect_to edit_restaurant_settings_path(@restaurant)
    else
      render :edit
    end
  end

  private

  def find_restaurant
    @restaurant = Restaurant.find(params[:restaurant_id])
  end

  def restaurant_params
    params.require(:restaurant).permit(
      :name,
      :city,
      :street,
      :zip_code,
      :capacity,
      :picture,
      :services,
      :opening_days,
      :opening_hours,
      :closing_hours,
      :tag_list
    )
  end
end
