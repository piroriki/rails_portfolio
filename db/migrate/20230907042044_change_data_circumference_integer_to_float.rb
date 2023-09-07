class ChangeDataCircumferenceIntegerToFloat < ActiveRecord::Migration[7.0]
  def change
    # float型に変更して、小数点までデータ保存できるように変更
    change_column :head_circumferences, :circumference, :float
  end
end
