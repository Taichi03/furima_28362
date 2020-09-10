FactoryBot.define do
  factory :item do
    item_name {'test'}
    item_info {'テスト商品'}
    item_category_id {2}
    item_sales_status_id {2}
    item_prefecture_id {2}
    item_scheduled_delivery_id {2}
    item_shipping_fee_status_id {2}
    # item_price {'１２３４'}
    item_price {'300'}
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.jpeg'), filename: 'test_image.jpeg')
    end
  end
end
