class Keyword < ApplicationRecord
  belongs_to :registration
  
  validates :registrations_id, presence: true
  validates :keyword, presence: true, length: { maximum: 255 }
end
