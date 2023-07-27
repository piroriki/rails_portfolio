class CreateMeals < ActiveRecord::Migration[7.0]
  def change
    create_table :meals do |t|
      t.string :kinds
      t.text :amount
      t.datetime :time
      t.text :memo
      t.integer :user_id

      t.timestamps
    end
  end
end
