class ChildRelation < ApplicationRecord
  belongs_to :child_id
  belongs_to :user_id

  validates :child_id, presence: true
  validates :user_id, presence: true
end
