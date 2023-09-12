class AddKindToMilks < ActiveRecord::Migration[7.0]
  def change
    add_column :milks, :kind, :integer, null: false, default: false
  end
end
