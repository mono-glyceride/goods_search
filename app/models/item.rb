class Item < ApplicationRecord
	has_many :items_registrations, dependent: :destroy
  has_many :registrations, through: :items_registrations
  validates :name, presence: true, uniqueness: true, length: { maximum: 255 }
end
