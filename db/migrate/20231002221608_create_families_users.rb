class CreateFamiliesUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :families_users, id: false do |t|
      t.bigint :family_id, null: false
      t.bigint :user_id, null: false
    end

    add_index :families_users, :family_id
    add_index :families_users, :user_id
  end
end
