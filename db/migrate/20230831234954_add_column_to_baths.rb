class AddColumnToBaths < ActiveRecord::Migration[7.0]
  def change
    add_reference :baths, :user, foreign_key: true, null: false
  end
end
