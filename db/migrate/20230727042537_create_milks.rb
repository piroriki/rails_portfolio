class CreateMilks < ActiveRecord::Migration[7.0]
  def change
    create_table :milks do |t|
      t.string :kinds
      t.integer :amount
      t.datetime :time
      t.text :memo
      t.integer :user_id

      t.timestamps
    end
  end
end
