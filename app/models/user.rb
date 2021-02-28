class User < ActiveRecord::Base
    has_secure_password
    validates :username, :password, presence: true
    validates_uniqueness_of :email, presence: true
    validates_uniqueness_of :username, presence: true
  
    has_many :cars
  end