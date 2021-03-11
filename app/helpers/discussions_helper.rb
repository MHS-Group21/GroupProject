module DiscussionsHelper
  #Checking whether the user is signed in and whether the current signed in user is the same as the user who wrote the discussion
  #this is done by passing the discussion into the method
  def discussion_author(discussion)
    user_signed_in? && current_user.id == discussion.user_id
  end

  #checking for the replying user as to whether they are the one who wrote the reply
  def reply_author(reply)
    user_signed_in? && current_user.id == reply.user_id
  end

end
