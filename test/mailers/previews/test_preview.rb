class TestPreview < ActionMailer::Preview
  def test
    BookingMailer.reminder(Booking.last.id)
  end
end
