class Medicine < ApplicationRecord
    belongs_to :user

    validates :time, presence: true
    validates :memo, length: { maximum: 100 }
end
