class HeadCircumference < ApplicationRecord

    belongs_to :user

    validates :circumference, presence: true
    validates :time, presence: true
end
