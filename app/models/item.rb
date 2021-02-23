class Item < ApplicationRecord
  belongs_to :user

  include ActiveHash::Associations
  has_many :areas
  has_many :categorys
  has_many :condition
  has_many :periods
  has_many :postage
end
