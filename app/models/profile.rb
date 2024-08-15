class Profile < ApplicationRecord
    belongs_to :user
    belongs_to :organization
    has_one :photo, as: :imageable
end
