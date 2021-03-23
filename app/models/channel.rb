class Channel < ApplicationRecord
    has_many :discussions
    has_many :users, through: :discussions
    resourcify

    extend FriendlyId
    friendly_id :name, use: [:slugged, :finders]

    def should_generate_new_friendly_id?
      name_changed?
    end

  end
