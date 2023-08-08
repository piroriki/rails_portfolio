class CreateMeals < ActiveRecord::Migration[7.0]
  def change
    create_table :meals do |t|
      t.string :kinds, null: false
      t.text :amount, null: false
      t.datetime :time, null: false
      t.text :memo, limit: 100
      t.integer :user_id

      t.timestamps
    end
  end
end
