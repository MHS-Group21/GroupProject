class Discussion < ApplicationRecord
    # Establishing the relationship
    belongs_to :channel
    belongs_to :user
    has_many :replies, dependent: :destroy
    has_one :discussion_report, dependent: :destroy

    # presence check when creating a new discussion
    validates :title, :content, presence: true

    extend FriendlyId
    friendly_id :title, use: [:slugged, :finders]

    # Method to create friendly urls
    def should_generate_new_friendly_id?
      title_changed?
    end
end
