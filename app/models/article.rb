class Article < ApplicationRecord 
  include Visible

  has_one :photo, as: :imageable, dependent: :destroy
  has_many :comments, dependent: :destroy

  belongs_to :user
  belongs_to :organization

  validates :title, presence: true
  validates :body, presence: true, length: {minimum: 10}

  accepts_nested_attributes_for :photo
end