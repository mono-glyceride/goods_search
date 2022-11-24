class Item < ApplicationRecord
  has_many :items_registrations, dependent: :restrict_with_error
  has_many :registrations, through: :items_registrations
  has_many :offers, dependent: :destroy

  with_options presence: true do
    with_options length: { maximum: 255 } do
      validates :wanted_item, uniqueness: { scope: :owned_item }
      validates :owned_item
    end
  end

  def self.save_items(wanted_item, owned_item_list)
    owned_item_list.each do |owned_item|
      item = Item.new(wanted_item: wanted_item, owned_item: owned_item)
      item.save if item.valid?
    end
  end
end
