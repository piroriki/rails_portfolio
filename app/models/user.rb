class User < ApplicationRecord
    has_secure_password

    # 各モデルとの関連づけ
    has_many :milks, dependent: :destroy
    has_many :meals, dependent: :destroy
    has_many :baths, dependent: :destroy
    has_many :medicines, dependent: :destroy
    has_many :execretions, dependent: :destroy
    has_many :symptoms, dependent: :destroy
    has_many :vaccinations, dependent: :destroy
    has_many :diaries, dependent: :destroy

    validates :name, presence: true, length: { maximum: 50 }
    validates :email, presence: true, uniqueness: true, length: { maximum: 100 }
end
