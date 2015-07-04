class ApplicationController < ActionController::Base
  # include Pundit



  protect_from_forgery with: :exception

  before_action :set_restaurant, if: :user_signed_in?
  before_action :set_restaurants, if: :user_signed_in?

  before_action :authenticate_user!, unless: :pages_controller?

  # after_action :verify_authorized, except:  :index, unless: :devise_or_pages_controller?
  # after_action :verify_policy_scoped, only: :index, unless: :devise_or_pages_controller?

  # rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  before_filter :configure_permitted_parameters, if: :devise_controller?
  ## ...



  private

  def devise_or_pages_controller?
    devise_controller? || pages_controller?
  end

  def pages_controller?
    controller_name == "pages"  # Brought by the `high_voltage` gem
  end

  def set_restaurant
    #@restaurant = current_user.restaurants.first
    @booking    = Booking.new
  end

  def set_restaurants
    @restaurants = current_user.restaurants
  end

  def user_not_authorized
    flash[:error] = I18n.t('controllers.application.user_not_authorized', default: "You can't access this page.")
    redirect_to(root_path)
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:first_name, :last_name, :email, :password) }
    devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:first_name, :last_name, :email, :password) }
  end

  def after_sign_in_path_for(resource)
    '/restaurants'
  end

  def after_sign_up_path_for(resource)
    '/restaurants'
  end

end
