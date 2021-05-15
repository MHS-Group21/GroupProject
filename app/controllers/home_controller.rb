class HomeController < ApplicationController
  def index
  # If condition to send users to the right path
    # If user is not logged in, sends them to the root path 
    if !current_user.present?
      redirect_to root_path, alert: "Please sign in to view this page"
    # If user is volunteer, sends them to the volunteer path
    elsif current_user.volunteer == true 
      redirect_to volunteer_path, notice: "Welcome Volunteer"
    # TODO If user is admin, sends them to the admin path
    elsif current_user.has_role?(:admin)
      redirect_to admin_path, notice: "Welcome Admin"
    else
      redirect_to edit_user_registration_path
    end

  end

  def admin
    #unless statement to check if user is an admin and if not redirects to home with an alert
    unless current_user.present? && current_user.has_role?(:admin)
      redirect_to root_path, alert: "Only an admin can view this page"
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

  def volunteer_list
    unless current_user.present? && current_user.has_role?(:admin)
      redirect_to root_path, alert: "Only an admin can view this page"
    end
    @users = User.volunteer_list
  end

  def twitter
    # Giving a username variable and an options variable that are used as parameters for the user_timeline method
    username = 'MHS_Group21'
    options = {:count => 20, :include_rts => true, :tweet_mode => 'extended'}
    # Making a tweets variable that stores the JSON file that is received for user_timeline method
    @tweets = $client.user_timeline(username, options)
    
    # Method to get tweets from home timeline
    # @tweets = $client.home_timeline
  end

  def policy
  end

end
