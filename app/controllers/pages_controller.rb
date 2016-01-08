class PagesController < ApplicationController

  def home
  end

  def features
  end

  def contact
  end

  def more_info
    # raise
    @first_name = params[:visitor_first_name]
    @last_name = params[:visitor_last_name]
    @email = params[:visitor_email]
    @message = params[:visitor_message]
    UserMailer.more_info(@first_name, @last_name, @email, @message).deliver_now
    redirect_to root_path
  end
end
