class CreateCollections < ActiveRecord::Migration[6.0]
  def change
    create_table :collections do |t|
      t.references :tweet, foreign_key: true, null: false
      t.references :supplying, foreign_key: { to_table: 'items' }
      t.references :demanding, foreign_key: { to_table: 'items' }
      t.timestamps
    end
    add_index  :collections, [:tweet, :supplying, :demanding], unique: true
  end
end
