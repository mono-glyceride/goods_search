class Item < ApplicationRecord
	has_many :items_registrations, dependent: :destroy
  has_many :registrations, through: :items_registrations
  has_many :offers, dependent: :destroy
  validates :name, presence: true, uniqueness: true, length: { maximum: 255 }
end
