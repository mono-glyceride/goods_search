class Config < ApplicationRecord
  belongs_to :user

  validates :notify_by_dm, inclusion: { in: [true, false] }
  validates :user_id, presence: true, uniqueness: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
end
