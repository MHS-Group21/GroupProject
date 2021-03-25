class HomeController < ApplicationController
  # Empty action at the moment so it could be removed later
  def index
  # If condition to send users to the right path
    # If user is not logged in, sends them to the root path 
    if !current_user.present?
      redirect_to root_path, alert: "Please sign in to view this page"
    # If user is volunteer, sends them to the volunteer path
    elsif current_user.volunteer == true 
      redirect_to volunteer_path, notice: "Welcome Volunteer"
    # TODO If user is admin, sends them to the admin path
    elsif has_role?(:admin)
      redirect_to admin_path, notice: "Welcome Admin"
    else
      redirect_to edit_user_registration_path
    end
  end

  def volunteer
    unless current_user.present? && current_user.volunteer == true 
      # Alert text to let them know why they can't access the page
      redirect_to root_path, alert: "Only a volunteer can view this page"
    end

    # If they completed both questionnaire and id verificaiton, make them an volunteer
    # Maybe a btn to make the user become a volunteer (rolifiy wise)
  end

end
