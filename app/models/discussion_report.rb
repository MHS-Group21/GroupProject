class DiscussionReport < ApplicationRecord
  # Establishing the relationship
  belongs_to :discussion
  belongs_to :user

  enum review_status: [:unreviewed, :unreviewed_hidden, :reviewed, :removed]
end
