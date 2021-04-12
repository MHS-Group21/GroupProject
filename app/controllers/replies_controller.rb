class RepliesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_reply, only: [:edit, :update, :show, :destroy]
  before_action :set_discussion

  def create
  #   @reply = @discussion.replies.create(reply_params)
  #   @reply.user_id = current_user.id
  #
  #   respond_to do |format|
  #     if @reply.save
  #       format.html { redirect_to discussion_path(@discussion)}
  #       format.js # render create.js.erb
  #     else
  #       format.html {redirect_to discussion_path(@discussion),
  #         notice: 'Reply did not save. Please try again'}
  #         format.js
  #     end
  #   end
  # end
    @discussion = Discussion.find(params[:discussion_id])
    @reply = @discussion.replies.create(reply_params)
    @reply.user_id = current_user.id

    respond_to do |format|
      if @reply.save
        format.html { redirect_to discussion_path(@discussion)}
        format.js # render create.js.erb
      else
        format.html {redirect_to discussion_path(@discussion),
        notice: 'Reply did not save. Please try again'}
        format.js
      end
    end
  end

  def new
    @discussion = Discussion.find(params[:discussion_id])
  end

  def destroy
    @reply = @discussion.replies.find(params[:id])
    @reply.destroy
  end

  def edit
    @discussion = Discussion.find(params[:discussion_id])
    @reply = @discussion.replies.find(params[:id])
  end

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

  def set_discussion
    @discussion = Discussion.find(params[:discussion_id])
  end

  def set_reply
    @reply = Reply.find(params[:id])
  end

  def reply_params
    params.require(:reply).permit(:reply_text, :discussion_id, :parent_id)
  end
end
