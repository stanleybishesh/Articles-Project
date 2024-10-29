class Organization < ApplicationRecord
  has_many :profiles
  has_many :articles
  has_many :memberships
  has_many :users, through: :memberships
end
