class Match < ApplicationRecord
  belongs_to :tweet
  belongs_to :registration

  validates :tweet_id, presence: true
  validates :registration_id, presence: true, uniqueness: { scope: :tweet_id }
end
