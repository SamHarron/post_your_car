class Car < ActiveRecord::Base
    belongs_to :user
    validates :make, presence: true
    validates :model, presence: true
    validates :year, presence: true
    validates :mileage, presence: true

end