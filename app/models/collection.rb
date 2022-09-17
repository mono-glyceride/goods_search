class Collection < ApplicationRecord
	#ツイッタラーに需要あるグッズ
	belongs_to :demanding, class_name: 'Item', optional: true
	#ツイッタラーが供給するグッズ
  belongs_to :supplying, class_name: 'Item', optional: true
  belongs_to :tweet
  
  validates :tweet_id, presence: true
end
