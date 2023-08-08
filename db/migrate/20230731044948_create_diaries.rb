class CreateDiaries < ActiveRecord::Migration[7.0]
  def change
    create_table :diaries do |t|
      t.text :title, null: false
      t.text :content, null: false, limit: 1000

      t.timestamps
    end
  end
end
