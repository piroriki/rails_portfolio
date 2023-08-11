class Milk < ApplicationRecord

    belongs_to :user

    scope :recent, -> { order(created_at: :desc) }

    validates :kinds, presence: true
    validates :amount, presence: true, numericality: true
    validates :time, presence: true
    validates :memo, length: { maximum: 100 }
end
