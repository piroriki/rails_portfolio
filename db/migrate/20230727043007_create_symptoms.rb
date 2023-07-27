class CreateSymptoms < ActiveRecord::Migration[7.0]
  def change
    create_table :symptoms do |t|
      t.string :kinds
      t.datetime :time
      t.text :memo
      t.integer :user_id

      t.timestamps
    end
  end
end
