class MerchandiseForm
  include ActiveModel::Model
  include ActiveModel::Attributes

  attribute :wanted_merchandise
  attribute :owned_merchandises
  attribute :keywords

  with_options length: { maximum: 255 } do
    validates :wanted_merchandise, presence: true
    validates :owned_merchandises, presence: true
    validates :keywords
  end

  def save(current_user)
    # registrationの作成
    registration = current_user.registrations.create
    self.create_keywords(registration) if self.keywords.present?
    owned_merchandise_list = self.owned_merchandises.split(/[[:blank:]]+/).select(&:present?)
    # itemの作成
    Item.save_items(self.wanted_merchandise, owned_merchandise_list)
    # items_registrations(中間テーブル)のレコードの作成
    items = Item.where(wanted_item: self.wanted_merchandise, owned_item: owned_merchandise_list)
    registration.save_items_registrations(items.ids)
  end

  def create_keywords(registration)
    keyword_list = self.keywords.split(/[[:blank:]]+/).select(&:present?)
    registration.save_keyword(keyword_list)
  end
end