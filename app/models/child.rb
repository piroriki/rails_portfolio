class Child < ApplicationRecord

    has_many :child_relations, dependent: :destroy, foreign_key: 'child_id'
    has_many :users, through: :child_relations, source: :user

    # enum用に変数定義する
    enum gender: { male: 0, female: 1, others: 2 }

    validates :child_name, presence: true
    validates :age, presence: true
    validates :gender, presence: true

    def self.ransackable_attributes(auth_object = nil)
        %w[child_name age gender created_at updated_at]
    end

    def self.ransackable_associations(auth_object = nil)
        []
    end
end
