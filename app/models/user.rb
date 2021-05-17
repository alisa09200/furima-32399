class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items
  has_one :card, dependent: :destroy
  has_many :comments

  with_options presence: true do
    validates :nickname
    validates :last_name
    validates :first_name
    validates :birthday
    validates :last_name_kana
    validates :first_name_kana
  end

  with_options format: { with: /\A[ぁ-んァ-ヶ一-龥々]+\z/ } do
    validates :last_name
    validates :first_name
  end

  with_options format: { with: /\A[ァ-ヶ]+\z/ } do
    validates :last_name_kana
    validates :first_name_kana
  end

  validates :password, format: { with: /(?=.*[a-zA-Z])(?=.*\d)[a-zA-Z\d]{6,}/}

  def self.guest
    find_or_create_by(email: "test@com") do |user|
      user.password = 123abc
    end
  end

end
