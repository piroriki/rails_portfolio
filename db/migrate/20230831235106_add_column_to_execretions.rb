class AddColumnToExecretions < ActiveRecord::Migration[7.0]
  def change
    add_reference :execretions, :user, foreign_key: true, null: false
  end
end
