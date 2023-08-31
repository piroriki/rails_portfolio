class AddColumnToMilks < ActiveRecord::Migration[7.0]
  def change
    add_reference :milks, :user, foreign_key: true, null: false
  end
end
