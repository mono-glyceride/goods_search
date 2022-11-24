class Registration < ApplicationRecord
  belongs_to :user
  has_many :keywords, dependent: :destroy
  has_many :items_registrations, dependent: :destroy
  has_many :items, through: :items_registrations
  has_many :matches, dependent: :destroy

  validates :user_id, presence: true

  def save_keyword(keyword_list)
    keyword_list.each do |keyword|
      @keyword = self.keywords.build
      @keyword.keyword = keyword
      @keyword.save if @keyword.valid?
    end
  end

  def save_items_registrations(item_ids)
    item_ids.each do |item_id|
      items_registrations = self.items_registrations.build
      items_registrations.item_id = item_id
      items_registrations.save if items_registrations.valid?
    end
  end
end
