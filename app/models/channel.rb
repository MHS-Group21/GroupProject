class Channel < ApplicationRecord
    # Establishing the relationship
    has_many :discussions
    has_many :users, through: :discussions

    extend FriendlyId
    friendly_id :name, use: [:slugged, :finders]

    # Method to create friendly urls
    def should_generate_new_friendly_id?
      name_changed?
    end

  end
