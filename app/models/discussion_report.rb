class DiscussionReport < ApplicationRecord
  belongs_to :discussion
  belongs_to :user

  enum review_status: [:unreviewed, :unreviewed_hidden, :reviewed, :removed]
end
