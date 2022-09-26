class CreateTweets < ActiveRecord::Migration[6.0]
  def change
    create_table :tweets do |t|
      t.string :param, null: false, unique: true
      t.string :tweet_user_name, null: false
      t.string :tweet_user_icon, null: false
      t.string :image1_url
      t.string :image2_url
      t.string :image3_url
      t.string :image4_url
      t.string :body, null: false
      t.boolean :send, null: false, default: false
      t.timestamps
    end
  end
end
