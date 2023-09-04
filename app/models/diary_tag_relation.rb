class DiaryTagRelation < ApplicationRecord

    # 中間テーブルのため、関連させるテーブル情報を対１で設定する
    belongs_to :diary
    belongs_to :diary_tag

    validates :diary_id, presence: true
    validates :diary_tag_id, presence: true
    
end
