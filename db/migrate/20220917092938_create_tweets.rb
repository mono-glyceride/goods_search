class CreateTweets < ActiveRecord::Migration[6.0]
  def change
    create_table :tweets do |t|
      t.string :param, null: false, unique: true
      t.string :tweet_user_name, null: false
      t.string :tweet_user_icon, null: false
      t.string :image_1
      t.string :image_2
      t.string :image_3
      t.string :image_4
      t.string :body, null: false
      t.boolean :send, null: false, default: false
      t.timestamps
    end
  end
end
