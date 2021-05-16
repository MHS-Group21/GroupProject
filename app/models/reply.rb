class Reply < ApplicationRecord
    # Establishing the relationship
    belongs_to :discussion
    belongs_to :user
    has_one :reply_report, dependent: :destroy

    belongs_to :parent, class_name: 'Reply', optional: true
    has_many :responses, class_name: 'Reply', foreign_key: :parent_id, dependent: :destroy

    has_one :reply_report, dependent: :destroy

    # presence check when creating a new reply
    validates :reply_text, :user, presence: true

    extend FriendlyId
    friendly_id :reply_text, use: [:slugged, :finders]

    # Method to create friendly urls
    def should_generate_new_friendly_id?
      reply_text_changed?
    end

  end
