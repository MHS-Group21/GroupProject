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

  def contact
  end

  #sends contact email to user
  def request_contact
    @name = params[:name]
    @email = params[:email]
    @message = params[:message]
    #checks if the email or message is left blank
    if @email.blank? | @message.blank?
      #alerts user that the email or message has been left blank
      flash[:alert] = "Make sure that email and message are not left blank"
      #refreshes the page
      redirect_to request.referer
    else
      #sends the email
      ContactMailer.contact_email(@email, @name, @message).deliver
      #sends a notice that confirms that the email has been sent
      flash[:notice] = "Thank you for contacting us, we'll reply as soon as possible"
      #redirects to the home page
      redirect_to root_path
    end

  end

end
