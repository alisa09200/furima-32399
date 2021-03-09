class PurchaseAddress
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postalcode, :area_id, :city, :block, :building, :phone, :purchase, :token

  with_options presence: true do
    validates :postalcode, format: { with: /\A\d{3}[-]\d{4}\z/ }
    validates :city
    validates :block
    validates :phone, format: { with: /\A\d{,11}\z/ }
    validates :token
    validates :item_id
    validates :user_id
  end

  validates :area_id, numericality: { other_than: 1 }

  def save
    purchase = Purchase.create(user_id: user_id, item_id: item_id)
    Address.create(postalcode: postalcode, area_id: area_id, city: city, block: block, building: building, phone: phone, purchase_id: purchase.id)
  end
end