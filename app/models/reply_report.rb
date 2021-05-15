class ReplyReport < ApplicationRecord
  # Establishing the relationship
  belongs_to :reply
  belongs_to :user

  enum review_status: [:unreviewed, :unreviewed_hidden, :reviewed, :removed]
end
