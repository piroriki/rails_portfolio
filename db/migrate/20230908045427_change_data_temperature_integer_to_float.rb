class ChangeDataTemperatureIntegerToFloat < ActiveRecord::Migration[7.0]
  def change
    change_column :temperatures, :temperature, :float
  end
end
