class User < ApplicationRecord
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable

  has_one :profile, dependent: :destroy
  has_many :articles
  has_many :comments

  has_many :memberships

  has_many :organizations, through: :memberships

end