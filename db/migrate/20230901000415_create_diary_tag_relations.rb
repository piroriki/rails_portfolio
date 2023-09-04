class CreateDiaryTagRelations < ActiveRecord::Migration[7.0]
  def change
    create_table :diary_tag_relations do |t|
      t.references :diary, foreign_key: true, null: false
      t.references :diary_tag, foreign_key: true, null: false

      t.timestamps

    end
  end
end
