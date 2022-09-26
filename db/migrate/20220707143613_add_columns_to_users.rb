class AddColumnsToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :uid, :string, null: false
    add_column :users, :provider, :string, null: false
    add_column :users, :name, :string, null: false
    add_column :users, :image, :string, null: false
    add_column :users, :nickname, :string, null: false
  end
  add_index :users, :uid, unique: true
end
