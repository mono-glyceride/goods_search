class CreateOffers < ActiveRecord::Migration[6.0]
  def change
    create_table :offers do |t|
      t.references :items, foreign_key: true, null: false
      t.references :tweets, foreign_key: true, null: false
      t.timestamps
    end
    add_index :offers, [:item_id, :tweet_id], unique: true
  end
end
