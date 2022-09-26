class Registration < ApplicationRecord
	belogns_to :user
	has_many :keywords, dependent: :destroy
  has_many :items_registrations, dependent: :destroy
  has_many :items, through: :items_registrations
  
  validates :user_id, presence: true
end
