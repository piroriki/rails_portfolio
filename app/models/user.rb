class User < ApplicationRecord
    has_secure_password

    has_many :milks

    validates :name, presence: true
    validates :email, presence: true, uniqueness: true
end
