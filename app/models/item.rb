class Item < ApplicationRecord
  has_many :items_registrations, dependent: :restrict_with_error
  has_many :registrations, through: :items_registrations
  has_many :offers, dependent: :destroy
  
  with_options presence: true do
    with_options length: { maximum: 255 } do
      validates :wanted_item, uniqueness: { scope: :wanted_item }
      validates :owned_item
    end
  end
end
