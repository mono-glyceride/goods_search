class CreateItemsRegistrations < ActiveRecord::Migration[6.0]
  def change
    create_table :items_registrations do |t|
      t.references :registration, foreign_key: true, null: false
      t.references :item, foreign_key: true, null: false
      t.timestamps
    end
  end
end
