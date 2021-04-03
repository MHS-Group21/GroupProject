class Reply < ApplicationRecord
    belongs_to :discussion
    belongs_to :user
    has_one :reply_report, dependent: :destroy

    validates :reply_text, presence: true

    extend FriendlyId
    friendly_id :reply_text, use: [:slugged, :finders]

    def should_generate_new_friendly_id?
      reply_text_changed?
    end

  end
