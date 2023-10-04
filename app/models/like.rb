class Like < ApplicationRecord
  belongs_to :user_id
  belongs_to :diary_id
end
