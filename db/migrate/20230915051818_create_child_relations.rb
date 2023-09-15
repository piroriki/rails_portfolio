class CreateChildRelations < ActiveRecord::Migration[7.0]
  def change
    create_table :child_relations do |t|
      t.references :child, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
