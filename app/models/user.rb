class User < ApplicationRecord
  before_validation { email.downcase! }
  validates :user_name, presence: true, length: {maximum: 50}
  validates :email, presence: true, uniqueness: true, length: { maximum: 255 },
            format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
  validates :password, presence: true, length: { minimum: 6 }
  validates :profile, length: { maximum: 500 }
  has_secure_password
  has_many :feeds
  has_many :favorites, dependent: :destroy
  has_many :favorite_feeds, through: :favorites, source: :feed
end