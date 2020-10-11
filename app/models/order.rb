class Order < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  has_one :address
  belongs_to :user
  belongs_to :item

end
