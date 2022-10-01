class Keyword < ApplicationRecord
  belongs_to :registration

  validates :registration_id, presence: true
  validates :keyword, presence: true, length: { maximum: 255 }
end
