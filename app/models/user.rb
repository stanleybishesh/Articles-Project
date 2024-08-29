class User < ApplicationRecord
  validates :name, presence: true
  validates :email, presence: true
  validates :password, presence: true

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable

  has_one :profile, dependent: :destroy
  has_many :articles
  has_many :comments

  has_many :memberships

  has_many :organizations, through: :memberships

  def self.to_csv
    attributes = %w{Name Email Organization}
    CSV.generate(headers: true) do |csv|
      csv << attributes

      User.includes(:organizations).find_each do |user|
        user.organizations.each do |organization|
          csv << [user.name, user.email, organization.name]
        end
      end

    end
  end

end