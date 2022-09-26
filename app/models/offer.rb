class Offer < ApplicationRecord
	belogns_to :items
	belogns_to :tweets
end
