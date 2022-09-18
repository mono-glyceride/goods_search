class CreateSerchConditions < ActiveRecord::Migration[6.0]
  def change
    create_table :serch_conditions do |t|
      t.references :user, foreign_key: true, null: false
      t.references :wanted_item, foreign_key: { to_table: 'items' }
      t.references :owned_item, foreign_key: { to_table: 'items' }
      t.timestamps
    end
  end
end
