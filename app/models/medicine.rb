class Medicine < ApplicationRecord
    validates :time, presence: true
    validates :memo, length: { maximum: 100 }
end
