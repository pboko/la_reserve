module AgendaHelper
  def total_cuttlery_for(period, date, bookings)
    count = 0

    bookings.for_period(period).for_date(date).each do |booking|
      count += booking.pax unless booking.waiting_list?
    end

    return count
  end

  def total_waiting_cuttlery_for(period, date, bookings)
    count = 0

    bookings.for_period(period).for_date(date).each do |booking|
      count += booking.pax if booking.waiting_list?
    end

    return count
  end

  def agenda_day_css_class(period, date, bookings, capacity)
    css_class = "col-xs-12 dejdinend"

    if total_cuttlery_for(period, date, bookings) >= capacity
      css_class << " red"
    elsif total_cuttlery_for(period, date, bookings) >= (capacity - 10)
      css_class << " orange"
    end

    return css_class
  end
end
