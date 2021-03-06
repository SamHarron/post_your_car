class User < ActiveRecord::Base
  has_many :cars
  validates :user_id, presence: true
  validates :user_id, uniqueness: true
  validates :email, presence: true
  validates :email, uniqueness: true
  has_secure_password
end