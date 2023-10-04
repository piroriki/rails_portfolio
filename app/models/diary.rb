class Diary < ApplicationRecord

    belongs_to :user

    # タグの関連付け
    has_many :diary_tag_relations, dependent: :destroy
    has_many :diary_tags, through: :diary_tag_relations, source: :diary_tag

    # いいねの関連づけ
    has_many :likes

    # activestorageと紐づける
    has_one_attached :image

    # 登録日時に関して降順で選択する
    scope :recent, -> { order(created_at: :desc) }

    validates :title, presence: true, length: { maximum: 100 }
    validates :content, presence: true, length: { maximum: 5000 }


    def save_diary_tags(tags)
        # タグが存在する場合、タグ名を配列として全て取得する
        current_tags = self.diary_tags.pluck(:tag_name) unless self.diary_tags.nil?

        # 現在取得済みのタグを選別し、残りはold_tagsとして削除対象とする
        old_tags = current_tags - tags

        # 送信済みのタグからすでに登録のあるタグを除き、残りをnew_tagsとして保存対象にする
        new_tags = tags - current_tags

        # old_tagsを削除する
        old_tags.each do |old_tag|
            self.diary_tags.delete DiaryTag.find_by(tag_name: old_tag)
        end

        # new_tagsを保存する
        new_tags.each do |new_tag|
            new_diary_tag = DiaryTag.find_or_create_by(tag_name: new_tag)
            self.diary_tags << new_diary_tag
        end
    end
     
    # いいねがされたかどうかの判定
    def liked_by?(user)
        likes.where(user_id: user.id).exists?
    end

end
