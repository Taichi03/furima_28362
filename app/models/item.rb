class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  belongs_to_active_hash :item_category
  belongs_to_active_hash :item_prefecture
  belongs_to_active_hash :item_sales_status
  belongs_to_active_hash :item_prefecture
  belongs_to_active_hash :item_shipping_fee_status
  belongs_to_active_hash :item_scheduled_delivery
  has_one_attached :image
  has_one :order

  with_options presence: true do
    with_options numericality: { greater_than_or_equal_to: 300 } do
      with_options numericality: { less_than_or_equal_to: 9_999_999 } do
        validates :item_price, format: { with: /\A[0-9]+\z/, message: 'is invalid. Input half-width.' }
      end
    end
    validates :image
    validates :item_name
    validates :item_info

    with_options numericality: { other_than: 1 } do
      validates :item_category_id
      validates :item_prefecture_id
      validates :item_sales_status_id
      validates :item_scheduled_delivery_id
      validates :item_shipping_fee_status_id
    end
  end
end
