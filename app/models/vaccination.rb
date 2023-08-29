class Vaccination < ApplicationRecord

    belongs_to :user

    # 登録日時に関して降順で選択する
    scope :recent, -> { order(created_at: :desc) }

    validates :kinds, presence: true
    validates :time, presence: true
    validates :memo, length: { maximum: 100 }
end
