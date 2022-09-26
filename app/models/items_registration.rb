class ItemsRegistration < ApplicationRecord
	belogns_to :registration
	belogns_to :items
end
