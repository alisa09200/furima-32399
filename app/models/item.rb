class Item < ApplicationRecord
  belongs_to :user
  has_one :purchase
  has_many_attached :images
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :area
  belongs_to :category
  belongs_to :condition
  belongs_to :period
  belongs_to :postage

  with_options presence: true do
    validates :images
    validates :product
    validates :explanation
    validates :price
  end

  with_options numericality: { other_than: 1 , message: 'は--以外の値にしてください'} do
    validates :category_id
    validates :condition_id
    validates :postage_id
    validates :area_id
    validates :period_id
  end

  validates :price, format: { with: /\A[0-9]+\z/ }, numericality: { greater_than: 300, less_than: 9999999 }
end
