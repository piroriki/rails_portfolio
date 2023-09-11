class RemoveKindsFromMilks < ActiveRecord::Migration[7.0]
  def change
    remove_column :milks, :kinds, :string
  end
end
