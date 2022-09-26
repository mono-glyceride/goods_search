class Tweet < ApplicationRecord
  has_many :offers, dependent: :destroy
  has_many :matches, dependent: :destroy

  with_options length: { maximum: 255 } do
    with_options presence: true do
      validates :param
      validates :tweet_user_name
      validates :tweet_user_icon
      validates :body
    end
    validates :image1_url
    validates :image2_url
    validates :image3_url
    validates :image4_url
  end
  validates :send, inclusion: { in: [true, false] }
end
