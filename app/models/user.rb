class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :products
  has_many :orders

  validates :user_name,               presence: true
  validates :family_name,            presence: true, format: { with: /\A[ぁ-んァ-ン一-龥々ー]/ }
  validates :family_name_kana,       presence: true, format: { with: /\A[ァ-ヶー－]+\z/ }
  validates :first_name,             presence: true, format: { with: /\A[ぁ-んァ-ン一-龥々ー]/ }
  validates :first_name_kana,        presence: true, format: { with: /\A[ァ-ヶー－]+\z/ }
  validates :birth_day, presence: true
end
