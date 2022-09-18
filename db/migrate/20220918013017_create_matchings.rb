class CreateMatchings < ActiveRecord::Migration[6.0]
  def change
    create_table :matchings do |t|
      t.references :tweet, foreign_key: true, null: false
      t.references :serch_condition, foreign_key: true, null: false
      t.timestamps
    end
    add_index :matchings, [:tweet_id, :serch_condition_], unique: true
  end
end
