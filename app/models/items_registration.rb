class ItemsRegistration < ApplicationRecord
  belongs_to :registration
  belongs_to :items

  validates :registration_id, presence: true
  validates :items_id, presence: true, uniqueness: { scope: :registration_id }
end
