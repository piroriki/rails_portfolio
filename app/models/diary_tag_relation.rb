class DiaryTagRelation < ApplicationRecord

    # 中間テーブルのため、関連させるテーブル情報を対１で設定する
    belongs_to :diary
    belongs_to :diary_tag_relation
    
end
