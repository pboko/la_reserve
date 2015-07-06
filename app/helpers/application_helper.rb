module ApplicationHelper
  def sidebar_css_class(menu_entry)
    return "active" if sidebar_active?(menu_entry)
  end

  def sidebar_active?(menu_entry)
    case menu_entry
    when :home
      controller_path == 'restaurants'
    when :calendar
      controller_path == 'bookings'
    when :contact
      controller_path == 'customers'
    when :config
      controller_path.start_with?('settings')
    when :stats
      controller_path == 'stats'
    end
  end
end
