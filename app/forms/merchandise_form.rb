class MerchandiseForm
  include ActiveModel::Model
  include ActiveModel::Attributes

  attribute :wanted_merchandise
  attribute :owned_merchandises
  attribute :keywords

  with_options length: { maximum: 255 } do
    validates :wanted_merchandise
    validates :owned_merchandises
    validates :keywords
  end

  def save(current_user)
    registration = current_user.registrations.create
    keyword_list = self.keywords.split(/[[:blank:]]+/).select(&:present?)
    registration.save_keyword(keyword_list)
    owned_merchandise_list = self.owned_merchandises.split(/[[:blank:]]+/).select(&:present?)
    Item.save_items(self.wanted_merchandise, owned_merchandise_list)
    items = Item.where(wanted_item: self.wanted_merchandise, owned_item: owned_merchandise_list)
    registration.save_items_registrations(items.ids)
  end
end