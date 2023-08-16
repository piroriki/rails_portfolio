class Meal < ApplicationRecord
    belongs_to :user

    validates :kinds, presence: true
    validates :amount, presence: true
    validates :time, presence: true
    validates :memo, length: { maximum: 100 }
end
