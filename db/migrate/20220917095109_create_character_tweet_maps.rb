class CreateCharacterTweetMaps < ActiveRecord::Migration[6.0]
  def change
    create_table :character_tweet_maps do |t|
      t.references :tweet, foreign_key: true, null: false
      t.references :character_user_want, foreign_key: { to_table: 'characters' }
      t.references :character_user_have, foreign_key: { to_table: 'characters' }
      t.timestamps
    end
    add_index  :character_tweet_maps, [:tweet, :character_user_want, :character_user_have], unique: true
  end
end
