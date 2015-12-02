class TestPreview < ActionMailer::Preview
  def test
    BookingMailer.reminder(Booking.last.id)
  end

  def welcome
    user = User.first
    UserMailer.welcome(user)
  end

end
