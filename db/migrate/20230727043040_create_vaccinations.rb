class CreateVaccinations < ActiveRecord::Migration[7.0]
  def change
    create_table :vaccinations do |t|
      t.string :kinds
      t.datetime :time
      t.text :memo
      t.integer :user_id

      t.timestamps
    end
  end
end
