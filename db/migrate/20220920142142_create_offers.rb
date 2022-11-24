class CreateOffers < ActiveRecord::Migration[6.0]
  def change
    create_table :offers do |t|
      t.references :item, foreign_key: true, null: false
      t.references :tweet, foreign_key: true, null: false
      t.timestamps
    end
    add_index :offers, [:item_id, :tweet_id], unique: true
  end
end
