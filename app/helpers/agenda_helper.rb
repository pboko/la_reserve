module AgendaHelper
  def total_cuttlery_for(period, date, bookings)
    count = 0
    bookings.for_period(period).for_date(date).each do |booking|
      count += booking.pax
    end
    return count
  end
end
