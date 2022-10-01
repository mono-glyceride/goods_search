class Offer < ApplicationRecord
  belongs_to :items
  belongs_to :tweets

  validates :items_id, presence: true
  validates :tweets_id, presence: true, uniqueness: { scope: :items_id }
end
