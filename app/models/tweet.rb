class Tweet < ApplicationRecord
	has_many :collections, dependent: :destroy
	has_many :matchings, dependent: :destroy
	has_many :serch_condition, through: :matchings
	
	with_options length: { maximum: 255 } do
		with_options presence: true do
	    validates :param, uniqueness: true
	    validates :tweet_user_name
	    validates :tweet_user_icon
	    validates :body
    end
    validates :image_1
    validates :image_2
    validates :image_3
    validates :image_4
  end
  validates :send, inclusion: { in: [true, false] }
end
