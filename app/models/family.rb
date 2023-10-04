class Family < ApplicationRecord
    # 中間テーブル設定
    has_and_belongs_to_many :users, dependent: :destroy

    validates :name, presence: true
end
