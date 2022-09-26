class Registration < ApplicationRecord
  belongs_to :user
  has_many :keywords, dependent: :destroy
  has_many :items_registrations, dependent: :destroy
  has_many :items, through: :items_registrations
  has_many :matches, dependent: :destroy
  
  validates :user_id, presence: true
end
