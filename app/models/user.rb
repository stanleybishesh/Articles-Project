class User < ApplicationRecord
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable

  has_many :articles

  has_many :memberships

  has_many :organizations, through: :memberships

end