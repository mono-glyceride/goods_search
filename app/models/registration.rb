class Registration < ApplicationRecord
	belogns_to :user
	has_many :keywords, dependent: :destroy
  has_many :combinations_registrations, dependent: :destroy
  has_many :combinations, through: :combinations_registrations
  
  validates :user_id, presence: true
end
