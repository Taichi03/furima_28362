class OrderAddress

  include ActiveModel::Model
  attr_accessor :token, :postal_code, :prefecture_id, :city, :phone_number, :building, :address, :item_id, :user_id

  with_options presence: true do
    validates :postal_code, format: { with: /\A\d{3}[-]\d{4}\z/, message: 'is invalid. Input hyphen.' }
    validates :phone_number, format: { with: /\A\d{10,11}\z/, message: 'is invalid. not needed hyphen.' }
    validates :city
    validates :address
    validates :item_id
    validates :user_id
    validates :token

    with_options numericality: { other_than: 1, message: 'Prefecture must be other than ---' } do
      validates :prefecture_id
    end
  end

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    # 住所の情報を保存
    Address.create(address: address, postal_code: postal_code, prefecture_id: prefecture_id, city: city, phone_number: phone_number, building: building, order_id: order.id)
  end

end