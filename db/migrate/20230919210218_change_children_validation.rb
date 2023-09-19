class ChangeChildrenValidation < ActiveRecord::Migration[7.0]
  def change
    change_column_default(:children, :gender, from: nil, to: false)
  end
end
