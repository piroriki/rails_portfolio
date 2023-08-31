class AddColumnToVaccinations < ActiveRecord::Migration[7.0]
  def change
    add_reference :vaccinations, :user, foreign_key: true, null: false
  end
end
