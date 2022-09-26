class Registration < ApplicationRecord
	belogns_to :user
	has_many :keywords, dependent: :destroy
  has_many :items_registrations, dependent: :destroy
  
  validates :user_id, presence: true
end
