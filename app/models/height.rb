class Height < ApplicationRecord

    belongs_to :user

    validates :height, presence: true
    validates :time, presence: true
end
