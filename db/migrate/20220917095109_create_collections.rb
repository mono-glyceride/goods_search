class CreateCollections < ActiveRecord::Migration[6.0]
  def change
    create_table :collection do |t|
      t.references :tweet, foreign_key: true, null: false
      t.references :wanted_item, foreign_key: { to_table: 'items' }
      t.references :owned_item, foreign_key: { to_table: 'items' }
      t.timestamps
    end
    add_index  :collection, [:tweet, :wanted_item, :owned_item], unique: true
  end
end
