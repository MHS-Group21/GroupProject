class HomeController < ApplicationController
  # Empty action at the moment so it could be removed later
  def index
  end

  def volunteer
    unless current_user.present? && current_user.volunteer == true 
      # Alert text to let them know why they can't accesss the page
      redirect_to root_path, alert: "Only a volunteer can view this page"
    end
  end

end
