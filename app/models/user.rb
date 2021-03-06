class User < ActiveRecord::Base
  has_many :cars
  validates :username, presence: true
  validates :username, uniqueness: true
  has_secure_password
end