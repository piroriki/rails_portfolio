class AddColumnToMeals < ActiveRecord::Migration[7.0]
  def change
    add_reference :meals, :user, foreign_key: true, null: false
  end
end
