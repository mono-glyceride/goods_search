class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :wanted_item, null: false, unique: true
      t.string :owned_item, null: false, unique: true
      t.timestamps
    end
    add_index :items, :wanted_item
    add_index :items, :owned_item
    add_index :items, [:wanted_item, :owned_item], unique: true
  end
end
