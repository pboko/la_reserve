class BookingMailer < ApplicationMailer
  def reminder(booking_id)
    @booking = Booking.find(booking_id)
    @restaurant = @booking.restaurant
    @customer = @booking.customer

    mail(
      # from: @booking.restaurant.email,
      to: @customer.email,
      subject: 'Rappel de votre réservation'
    )
  end
end
