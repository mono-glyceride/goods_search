class Item < ApplicationRecord
	has_many :owned_informations, class_name: 'SerchCondition', foreign_key: 'owned_item_id'
  has_many :wanted_informations, class_name: 'SerchCondition', foreign_key: 'wanted_item_id'
end
