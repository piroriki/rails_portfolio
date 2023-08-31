class AddColumnToSymptoms < ActiveRecord::Migration[7.0]
  def change
    add_reference :symptoms, :user, foreign_key: true, null: false
  end
end
