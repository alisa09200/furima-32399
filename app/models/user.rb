class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  validates :nickname, presence: true
  validates :last_name, presence: true
  validates :last_name, format:{with: /\A[ぁ-んァ-ヶ一-龥々]+\z/}
  validates :first_name, presence: true
  validates :first_name, format:{with: /\A[ぁ-んァ-ヶ一-龥々]+\z/}
  validates :birthday, presence: true
  validates :last_name_kana, presence: true
  validates :last_name_kana, format:{with: /\A[ァ-ヶ]+\z/}
  validates :first_name_kana, presence: true
  validates :first_name_kana, format:{with: /\A[ァ-ヶ]+\z/}
  validates :encrypted_password,:password,:password_confirmation,length:{minimum:6},format:{with: /(?=.*[a-zA-Z])(?=.*\d)[a-zA-Z\d]{6,}/}
end
