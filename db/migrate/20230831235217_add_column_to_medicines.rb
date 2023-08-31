class AddColumnToMedicines < ActiveRecord::Migration[7.0]
  def change
    add_reference :medicines, :user, foreign_key:true, null: false
  end
end
