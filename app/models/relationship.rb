class Relationship < ApplicationRecord
  belongs_to :following_id
  belongs_to :follwer_id
end
