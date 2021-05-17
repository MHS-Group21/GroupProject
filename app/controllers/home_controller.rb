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

  def twitter
    # Giving a username variable and an options variable that are used as parameters for the user_timeline method
    username = 'MHS_Group21'
    options = {:count => 20, :include_rts => true, :tweet_mode => 'extended'}
    # Making a tweets variable that stores the JSON file that is received for user_timeline method
    @tweets = $client.user_timeline(username, options)

    # Method to get tweets from home timeline
    # @tweets = $client.home_timeline
  end

  def questionnaire
    unless current_user.present? && current_user.volunteer == true && current_user.quiz_complete == false
      # Alert text to let them know why they can't access the page
      #current_user.quiz_complete = false
      #current_user.save
      redirect_to volunteer_path, alert: "Only a user who is volunteer and hasnt completed the quiz can view this page"
    end
  end

  def submit_questionnaire

    @total = Integer(params[:question1]) + Integer(params[:question2]) + Integer(params[:question3]) + Integer(params[:question4]) + Integer(params[:question5]) + Integer(params[:question6]) + Integer(params[:question7]) + Integer(params[:question8]) + Integer(params[:question9]) + Integer(params[:question10]) + Integer(params[:question11]) + Integer(params[:question12]) + Integer(params[:question13]) + Integer(params[:question14]) + Integer(params[:question15])+ Integer(params[:question16])+ Integer(params[:question17]) + Integer(params[:question18]) + Integer(params[:question19]) + Integer(params[:question20])

    if @total == 20
      flash.notice = "Well done. You have completed the volunteer training."
      current_user.quiz_complete = true
      current_user.save
      redirect_to volunteer_path
    end

    if @total < 20
      #flash.alert = @total
      flash.alert = "Unfortunately you have failed the training. You can try again when you're ready."
      redirect_to volunteer_path
    end
  end

  def policy
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
