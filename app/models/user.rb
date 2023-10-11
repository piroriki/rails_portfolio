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
    has_many :temperatures, dependent: :destroy
    has_many :head_circumferences, dependent: :destroy
    has_many :heights, dependent: :destroy
    has_many :weights, dependent: :destroy

    # 中間テーブルありの多対多の関連づけ
    has_many :diaries, dependent: :destroy
    has_many :likes, dependent: :destroy

    # 中間テーブル設定(中間テーブルで特別なカラムを持たせない場合のため、下記関連づけを使用)
    has_and_belongs_to_many :families, dependent: :destroy

    # following,followerモデルとの関連づけ

    # =====自分がフォローするユーザーとの関連======================================
    # フォローしているユーザーの情報を中間テーブル経由で集めるので、following_idを外部キーとして参照する
    has_many :active_relationships, class_name: 'Relationship', foreign_key: :following_id
    # 中間テーブル経由でfollowerモデルのユーザー情報を集めるので、followingsと新たに定義
    has_many :followings, through: :active_relationships, source: :follower
    # =======================================================================

    # =====自分がフォローされるユーザーとの関連====================================
    # フォローされるユーザー情報を中間テーブル経由で集めるので、follower_idを外部キーとして参照する
    has_many :passive_relationships, class_name: 'Relationship', foreign_key: :follower_id
    # 中間テーブル経由でfollowingモデルのユーザー情報を集めるので、followersと新たに定義
    has_many :followers, through: :passive_relationships, source: :following
    # =======================================================================

    # passive_relationshipsを通じて、フォロー予定のユーザーから既にフォローされているかどうかを調べる
    def followed_by?(user)
        passive_relationships.find_by(following_id: user.id).present?
    end

    validates :name, presence: true, length: { maximum: 50 }
    validates :email, presence: true, uniqueness: true, length: { maximum: 100 }
end
