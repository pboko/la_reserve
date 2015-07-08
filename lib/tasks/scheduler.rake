desc "Sends reminder mail to bookings that are scheduled in 3 days"
task booking_reminder: :environment do
  bookings = Booking.where(date: Date.today + 3.days)
  puts "Sending reminders..."

  bookings.each do |booking|
    booking.token = SecureRandom.hex(16)
    booking.save

    BookingMailer.reminder(booking.id).deliver_now
  end

  puts "Finished! #{bookings.count} mails sent."
end
