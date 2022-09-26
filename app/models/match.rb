class Match < ApplicationRecord
	belongs_to :tweet
	belongs_to :registration
end
