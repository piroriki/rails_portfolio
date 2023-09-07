class CreateHeadCircumferences < ActiveRecord::Migration[7.0]
  def change
    create_table :head_circumferences do |t|

      t.integer :circumference, null: false
      t.datetime :time, null: false

      t.references :user, foreign_key: true, null: false

      t.timestamps
    end
  end
end
