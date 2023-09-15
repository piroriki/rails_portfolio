class ChildRelation < ApplicationRecord
  belongs_to :child_id
  belongs_to :user_id
end
