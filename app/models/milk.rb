class Milk < ApplicationRecord

    belongs_to :user

    scope :recent, -> { order(created_at: :desc) }

    validates :kinds, presence: true
    validates :amount, presence: true, numericality: true
    validates :time, presence: true
    validates :memo, length: { maximum: 100 }

    def self.ransackable_attributes(auth_object = nil)
        #if auth_object == :admin
        #    super
        #else
        #    super & %w(kinds amount time memo)
        #end

        ['kinds','amount','time','memo','created_at','updated_at']
    end

    #private_class_method :ransackable_attributes
end
