class CreateDiaries < ActiveRecord::Migration[7.0]
  def change
    create_table :diaries do |t|
      t.text :title
      t.text :content

      t.timestamps
    end
  end
end
