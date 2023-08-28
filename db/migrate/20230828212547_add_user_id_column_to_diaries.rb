class AddUserIdColumnToDiaries < ActiveRecord::Migration[7.0]
  def change
    add_column :diaries, :user_id, :integer
  end
end
