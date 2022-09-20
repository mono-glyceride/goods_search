class CreateCombinations < ActiveRecord::Migration[6.0]
  def change
    create_table :combinations do |t|
      t.string :wanted_item, null: false, unique: true
      t.string :owned_item, null: false, unique: true
      t.timestamps
    end
    add_index :combinations, :wanted_item
    add_index :combinations, :owned_item
    add_index :combinations, [:wanted_item, :owned_item], unique: true
  end
end
