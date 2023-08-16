class User < ApplicationRecord
    has_secure_password

    has_many :milks, dependent: :destroy
    has_many :meals, dependent: :destroy

    validates :name, presence: true, length: { maximum: 20 }
    validates :email, presence: true, uniqueness: true, length: { maximum: 300 }
end
