class Child < ApplicationRecord

    has_many :child_relations, dependent: :destroy, foreign_key: 'child_id'
    has_many :users, through: :child_relations, source :user

    validates :child_name, presence: true
    validates :age, presence: true
    validates :gender, presence:true
end
