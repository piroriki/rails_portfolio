class Diary < ApplicationRecord
    belongs_to :user

    # activestorageと紐づける
    has_one_attached :image

    # 登録日時に関して降順で選択する
    scope :recent, -> { order(created_at: :desc) }

    validates :title, presence: true, length: { maximum: 100 }
    validates :content, presence: true, length: { maximum: 5000 }
end
