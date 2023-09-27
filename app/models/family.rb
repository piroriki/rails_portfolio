class Family < ApplicationRecord
    # 中間テーブルの設定
    has_many :groups, dependent: :destroy
    has_many :users, through: :groups, source: :user
end
