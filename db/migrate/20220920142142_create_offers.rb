class CreateOffers < ActiveRecord::Migration[6.0]
  def change
    create_table :offers do |t|
      t.references :combinations, foreign_key: true, null: false
      t.references :tweets, foreign_key: true, null: false
      t.timestamps
    end
    add_index :offers, [:combination_id, :tweet_id], unique: true
  end
end
