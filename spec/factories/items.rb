FactoryBot.define do
  factory :item do
    association :user
    item_price {'１２３４'}
    item_price {'200'}
  end
end
