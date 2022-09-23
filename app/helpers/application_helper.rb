module ApplicationHelper
  include Pagy::Frontend

  #highlight active link
  def active_link_to(name, path)
    content_tag(:li, class: "#{'active fw-bold' if current_page?(path)} nav-item") do
      link_to name, path, class: "nav-link"    
    end 
  end 
 
end
