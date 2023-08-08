class Bath < ApplicationRecord
    validates :time, presence: true
    validates :memo, presence: true, length: { maximum: 100 }
end
