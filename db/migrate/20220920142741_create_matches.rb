class CreateMatches < ActiveRecord::Migration[6.0]
  def change
    create_table :matches do |t|
      t.references :registrations, foreign_key: true, null: false
      t.references :tweets, foreign_key: true, null: false
      t.timestamps
    end
    add_index :matches, [:registration_id, :tweet_id], unique: true
  end
end
