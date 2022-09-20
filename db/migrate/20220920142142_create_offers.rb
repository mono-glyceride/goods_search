class CreateOffers < ActiveRecord::Migration[6.0]
  def change
    create_table :offers do |t|
      t.references :combination_id, foreign_key: true, null: false
      t.references :tweet_id, foreign_key: true, null: false
      t.timestamps
    end
    add_index :offers, [:combination_id, :tweet_id], unique: true
  end
end
