class AddKinsToMilks < ActiveRecord::Migration[7.0]
  def change
    add_column :milks, :kinds, :integer
  end
end
