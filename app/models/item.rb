class Item < ApplicationRecord
  has_many :purchases
  has_many :favorites
  belongs_to :user
  with_options presence: true do
end
