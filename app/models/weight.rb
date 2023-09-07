class Weight < ApplicationRecord

    belongs_to :user

    validates :weight, presence: true
    validates :time, presence: true
end
