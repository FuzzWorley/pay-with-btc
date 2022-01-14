module ApplicationHelper
  def active_class(link_path)
    current_page?(link_path) ? "navActive" : ""
  end

  def pill_class(category)
    case category
    when 'lodging'
      'bg-success'
    when 'active'
      'bg-danger'
    when 'explore'
      'bg-warning text-dark'
    when 'relaxing'
      'bg-info text-dark'
    when 'food_and_drink'
      'bg-primary'
    end
  end
end
