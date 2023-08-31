class AddColumnToDiaries < ActiveRecord::Migration[7.0]
  def change
    add_reference :diaries, :user, foreign_key: true, null: false
  end
end
