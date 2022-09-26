class Tweet < ApplicationRecord
	has_many :offers, dependent: :destroy
	has_many :matches, dependent: :destroy
	
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
