class RepliesController < ApplicationController
# List of before actions to do for the controller
  before_action :authenticate_user!
  before_action :set_reply, only: [:edit, :update, :show, :destroy]
  before_action :set_discussion

  def create
    # Find a discussion based on the ID and create a reply for that
    @discussion = Discussion.find(params[:discussion_id])
    @reply = @discussion.replies.create(reply_params)
    # Linking the current user ID as the user ID of the reply
    @reply.user_id = current_user.id

    # Saves the reply if all the inputs of the reply is permitted
    respond_to do |format|
      if @reply.save
        # redirects to the discussion once the reply is posted
        format.html { redirect_to discussion_path(@discussion)}
        format.js # render create.js.erb
      else
        # # redirects to the discussion if the reoly is not posted and a notice is shown
        format.html {redirect_to discussion_path(@discussion),
        notice: 'Reply did not save. Please try again'}
        format.js
      end
    end
  end

  # Method to create a new reply 
  def new
    @discussion = Discussion.find(params[:discussion_id])
  end

  # Method to destroy a reply under a given discussion 
  def destroy
    @reply = @discussion.replies.find(params[:id])
    @reply.destroy
  end

  # Method to edit a reply under the given discussion ID and reply ID
  def edit
    @discussion = Discussion.find(params[:discussion_id])
    @reply = @discussion.replies.find(params[:id])
  end

  # Method to update the reply once it has been changed
  def update
    @reply = @discussion.replies.find(params[:id])
    respond_to do |format|
      if @reply.update(reply_params)
        format.js
      else
        format.js
      end
    end
  end

  private
  # method to set the discussion based on the discussion ID
  def set_discussion
    @discussion = Discussion.find(params[:discussion_id])
  end

  # method to set the reply based on the reply ID
  def set_reply
    @reply = Reply.find(params[:id])
  end

  # Only allowing permitted parameters to be saved into the database
  def reply_params
    params.require(:reply).permit(:reply_text, :discussion_id, :parent_id)
  end
end
