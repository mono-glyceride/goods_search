class SerchCondition < ApplicationRecord
	belogns_to :user
	belongs_to :wanted_item, class_name: 'Item', optional: true
  belongs_to :owned_item,  class_name: 'Item', optional: true
  has_many :matchings, dependent: :destroy
  has_many :tweets, through: :matchings
  
  validates :user_id, presence: true
  validate :required_either_wanted_item_or_owned_item
  def required_either_email_or_phone
    return if wanted_item_id.present? || owned_item_id.present?
    errors.add(:item_information, '求めるグッズと譲るグッズのどちらか一方、あるいは両方をご入力ください')
  end
end
