class RemoveGenderFromChildren < ActiveRecord::Migration[7.0]
  def change
    remove_column :children, :gender
  end
end
