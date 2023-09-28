class User < ApplicationRecord
    has_secure_password

    # 各モデルとの関連づけ(1対N)
    has_many :milks, dependent: :destroy
    has_many :meals, dependent: :destroy
    has_many :baths, dependent: :destroy
    has_many :medicines, dependent: :destroy
    has_many :execretions, dependent: :destroy
    has_many :symptoms, dependent: :destroy
    has_many :vaccinations, dependent: :destroy
    has_many :diaries, dependent: :destroy
    has_many :temperatures, dependent: :destroy
    has_many :head_circumferences, dependent: :destroy
    has_many :heights, dependent: :destroy
    has_many :weights, dependent: :destroy

    # 中間テーブル設定
    has_many :groups, dependent: :destroy
    has_many :families, through: :groups, source: :family
    accepts_nested_attributes_for :groups, allow_destroy: true

    validates :name, presence: true, length: { maximum: 50 }
    validates :email, presence: true, uniqueness: true, length: { maximum: 100 }
end
