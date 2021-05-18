class Discussion < ApplicationRecord
    # Establishing the relationship
    belongs_to :channel
    belongs_to :user
    has_many :replies, dependent: :destroy
    has_one :discussion_report, dependent: :destroy

    #validation
    validates :title, length: {minimum: 4, maximum: 25}
    validates :title, :content, :user, :channel, presence: true

    extend FriendlyId
    friendly_id :title, use: [:slugged, :finders]

    # Method to create friendly urls
    def should_generate_new_friendly_id?
      title_changed?
    end
end
