class Match < ApplicationRecord
	belogns_to :tweet
	belogns_to :registration
end
