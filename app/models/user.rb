class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do
    validates :nickname 
    validates :birth_date
    zen_name = /\A[ぁ-んァ-ン一-龥]/
    kana_name = /\A[ァ-ヶー－]+\z/
    half_width = /\A[a-zA-Z0-9]+\z/
    validates :first_name, format: { with: zen_name, message: 'is invalid. Input full-width characters.' }
    validates :last_name, format: { with: zen_name, message: 'is invalid. Input full-width characters.' }
    validates :first_name_kana, format: { with: kana_name, message: 'is invalid. Input full-width katakana characters.' }
    validates :last_name_kana, format: { with: kana_name, message: 'is invalid. Input full-width katakana characters.' }
    validates :password, format: { with: half_width, message: 'is invalid Input half-width.' }
  end
  
end
