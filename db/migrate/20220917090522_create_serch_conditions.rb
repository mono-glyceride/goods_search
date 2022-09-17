class CreateSerchConditions < ActiveRecord::Migration[6.0]
  def change
    create_table :serch_conditions do |t|
      t.references :user, foreign_key: true, null: false
      t.references :character_user_want, foreign_key: { to_table: 'characters' }
      t.references :character_user_have, foreign_key: { to_table: 'characters' }
      t.timestamps
    end
  end
end
