class CreateDiaryTags < ActiveRecord::Migration[7.0]
  def change
    create_table :diary_tags do |t|

      t.string :tag_name, limit: 50, null: false, unique: true

      t.timestamps
    end
  end
end
