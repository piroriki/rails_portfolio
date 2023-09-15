class CreateChildren < ActiveRecord::Migration[7.0]
  def change
    create_table :children do |t|
      t.string :child_name, null: false
      t.integer :age, null: false
      t.string :gender, null: false

      t.references :user, foreign_key: true, null: false

      t.timestamps
    end
  end
end
