class Like < ApplicationRecord
  belongs_to :user
  belongs_to :diary

  validates :user_id, presence: true
  validates :diary, presence: true
end
