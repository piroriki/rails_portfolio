class Temperature < ApplicationRecord
  
  belongs_to :user

  # 登録日時に関して降順で選択する
  scope :recent, -> { order(created_at: :desc) }

  validates :temperature, presence: true
  validates :time, presence: true

  # def self.ransackable_attributes(auth_object = nil)
  #     %w[kinds amount time memo created_at updated_at]
  # end
# 
  # def self.ransackable_associations(auth_object = nil)
  #     []
  # end

  #private_class_method :ransackable_attributes
end
