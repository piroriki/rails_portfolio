class Medicine < ApplicationRecord
    validates :kinds, presence: true
    validates :time, presence: true
    validates :memo, length: { maximum: 100 }
end
