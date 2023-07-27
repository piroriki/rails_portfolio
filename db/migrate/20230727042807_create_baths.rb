class CreateBaths < ActiveRecord::Migration[7.0]
  def change
    create_table :baths do |t|
      t.datetime :time
      t.text :memo
      t.integer :user_id

      t.timestamps
    end
  end
end
