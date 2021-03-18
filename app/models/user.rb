class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items
  has_many :histories

  with_options presence: true do
    validates :nickname
    validates :password, format: {with: /(?=.*[a-zA-Z])(?=.*\d)[a-zA-Z\d]/ }
    validates :family_name, format: {with: /\A[ぁ-んァ-ン一-龥]/ }
    validates :first_name, format: {with: /\A[ぁ-んァ-ン一-龥]/ }
    validates :family_name_kana, format: {with: /\A[ぁ-んァ-ン一-龥]/ }
    validates :first_name_kana, format: {with: /\A[ぁ-んァ-ン一-龥]/ }
    validates :birthday
  end
end
