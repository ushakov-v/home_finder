class Apartment < ApplicationRecord
    belongs_to :user

    validates :title, presence: true
    validates :description, presence: true
    validates :price, presence: true, numericality: {greater_then: 0 }
    validates :location, presence: true
end
