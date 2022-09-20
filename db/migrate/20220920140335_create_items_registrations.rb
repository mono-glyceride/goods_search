class CreateItemsRegistrations < ActiveRecord::Migration[6.0]
  def change
    create_table :items_registrations do |t|
      t.references :registrations, foreign_key: true, null: false
      t.references :items, foreign_key: true, null: false
      t.timestamps
    end
  end
end
