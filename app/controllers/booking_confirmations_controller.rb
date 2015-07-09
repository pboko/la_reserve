class BookingConfirmationsController < ApplicationController
  skip_before_action :authenticate_user!

  def show
    @booking  = Booking.find_by_token(params[:id])
    @choice   = params[:choice]

    case @choice
    when 'confirm'
      @booking.status = "Confirmé"
    when 'cancel'
      @booking.status = "Annulé"
    end

    @booking.save
  end
end
