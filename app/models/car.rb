class Car < ActiveRecord::Base
    belongs_to :user
    belongs_to :body_style
    validates :make, presence: true
    validates :model, presence: true
    validates :year, presence: true
    validates :mileage, presence: true

end