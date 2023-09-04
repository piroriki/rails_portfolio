class DiaryTag < ApplicationRecord

    # １つのタグに対して複数のタグの中間テーブル、複数の育児日記と関連づける
    has_many :diary_tag_relations, dependent: :destroy, foreign_key: 'diary_tag_id'
    has_many :diaries, through: :diary_tag_relations, source: :diary

    validates :tag_name, uniqueness: true, presence: true, length: { maximum: 50 }

end
