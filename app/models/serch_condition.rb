class SerchCondition < ApplicationRecord
	belogns_to :user
	belongs_to :wanted_item, class_name: 'Item', optional: true
  belongs_to :owned_item,  class_name: 'Item', optional: true
end
