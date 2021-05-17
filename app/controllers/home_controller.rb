class HomeController < ApplicationController
  # redirects users to the correct home controller action based on user role
  def index
  # If condition to send users to the right path
    # If user is not logged in, sends them to the root path
    if !current_user.present?
      redirect_to root_path, alert: "Please sign in to view this page"
    # If user is volunteer, sends them to the volunteer path
  elsif helpers.volunteer?
      redirect_to volunteer_path, notice: "Welcome Volunteer"
    # TODO If user is admin, sends them to the admin path
  elsif helpers.admin?
      redirect_to admin_path, notice: "Welcome Admin"
    else
      redirect_to edit_user_registration_path
    end

  end

  #Admin Account Page
  def admin
    #unless statement to check if user is an admin and if not redirects to home with an alert
    unless helpers.admin?
      redirect_to root_path, alert: "Only an admin can view this page"
    end
  end

  #Volunteer Account page
  def volunteer
    unless helpers.volunteer?
      # Alert text to let them know why they can't access the page
      redirect_to root_path, alert: "Only a volunteer can view this page"
    end

    # If they completed both questionnaire and id verificaiton, make them an volunteer
    # Maybe a btn to make the user becomecurrent_user.present? && current_user.volunteer == true a volunteer (rolifiy wise)
  end

  #Display a list of volunteers if user is admin, otherwise redirect
  def volunteer_list
    unless helpers.admin?
      redirect_to root_path, alert: "Only an admin can view this page"
    end
    @users = User.volunteer_list
  end

  #Display a page of tweets from the MHS twitter account (including retweets)
  def twitter
    # Giving a username variable and an options variable that are used as parameters for the user_timeline method
    username = 'MHS_Group21'
    options = {:count => 20, :include_rts => true, :tweet_mode => 'extended'}
    # Making a tweets variable that stores the JSON file that is received for user_timeline method
    @tweets = $client.user_timeline(username, options)

    # Method to get tweets from home timeline
    # @tweets = $client.home_timeline
  end

  #Volunteer questionaire
  def questionnaire
    unless helpers.volunteer? && current_user.volunteer.questionaire == false
      # Alert text to let them know why they can't access the page
      #current_user.quiz_complete = false
      #current_user.save
      redirect_to volunteer_path, alert: "Only a user who is volunteer and hasnt completed the quiz can view this page"
    end
  end

  #controlre action
  def submit_questionnaire
    @total = Integer(params[:question1]) + Integer(params[:question2]) + Integer(params[:question3]) + Integer(params[:question4]) + Integer(params[:question5]) + Integer(params[:question6]) + Integer(params[:question7]) + Integer(params[:question8]) + Integer(params[:question9]) + Integer(params[:question10]) + Integer(params[:question11]) + Integer(params[:question12]) + Integer(params[:question13]) + Integer(params[:question14]) + Integer(params[:question15])+ Integer(params[:question16])+ Integer(params[:question17]) + Integer(params[:question18]) + Integer(params[:question19]) + Integer(params[:question20])

    if @total == 20
      flash.notice = "Well done. You have completed the volunteer training."
      current_user.volunteer.questionaire = true
      current_user.save
      redirect_to volunteer_path
    end

    if @total < 20
      #flash.alert = @total
      flash.alert = "Unfortunately you have failed the training. You can try again when you're ready."
      redirect_to volunteer_path
    end
  end
end
