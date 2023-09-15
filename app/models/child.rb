class Child < ApplicationRecord

    belongs_to :user

    validates :child_name, presence: true
    validates :age, presence: true
    validates :gender, presence:true
end
