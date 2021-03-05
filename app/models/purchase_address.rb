class PurchaseAddress
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postalcode, :area_id, :city, :block, :building, :phone, :purchase

  #extend ActiveHash::Associations::ActiveRecordExtensions
  #belongs_to :area

  with_options presence: true do
    validates :postalcode, format: { with: /\A\d{3}[-]\d{4}\z/ }
    validates :city
    validates :block
    validates :building
    validates :phone, format: { with: /\d{,11}/ }
  end

  validates :area_id, numericality: { other_than: 1 }

  def save
    user = User.create(user_id: user.id)
    item = Item.create(item_id: item.id)
    purchase = Purchase.create(user_id: user.id, item_id: item.id)
    Address.create(postalcode: postalcode, prefectures_id: prefectures_id, city: city, block: block, building: building, phone: phone, purchase_id: purchase.id)
  end
end