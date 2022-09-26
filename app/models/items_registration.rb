class ItemsRegistration < ApplicationRecord
  belongs_to :registration
  belongs_to :items
  
  validates :registrations_id, presence: true
  validates :items_id, presence: true, uniqueness: { scope: :registrations_id }
end
