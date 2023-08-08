class CreateBaths < ActiveRecord::Migration[7.0]
  def change
    create_table :baths do |t|
      t.datetime :time, null: false
      t.text :memo, null: false, limit: 100
      t.integer :user_id

      t.timestamps
    end
  end
end
