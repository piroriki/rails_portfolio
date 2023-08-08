class CreateMilks < ActiveRecord::Migration[7.0]
  def change
    create_table :milks do |t|
      t.string :kinds, null: false
      t.integer :amount, null: false
      t.datetime :time, null: false
      t.text :memo, null: false, limit:100
      t.integer :user_id

      t.timestamps
    end
  end
end
