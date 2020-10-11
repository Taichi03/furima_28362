FactoryBot.define do
  factory :order_address do
    token {'sample'}
    postal_code {'123-4567'}
    city {'那覇市架空町括弧町'}
    address{'テスト1-2-3'}
    building{'テスト'}
    phone_number{'08012345678'}
    prefecture_id{ 2 }
  end
end