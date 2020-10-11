require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  before do
    buyer = FactoryBot.create(:user)
    seller = FactoryBot.create(:user, email: 'test@test456')
    item = FactoryBot.create(:item, user_id: seller.id)
    @order_address = FactoryBot.build(:order_address, user_id: buyer.id, item_id: item.id)
    sleep(1)
  end
  describe '商品購入機能' do
    it 'すべての値が正しく入力されていれば保存できる' do
      expect(@order_address).to be_valid
    end
    it 'カード情報が正しくなければ購入できない' do
      @order_address.token = nil
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Token can't be blank")
    end
    it '郵便番号が空だと購入できない事' do
      @order_address.postal_code = nil
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Postal code can't be blank")
    end
    it '郵便番号はハイフンが必要な事' do
      @order_address.postal_code = 5320022
      @order_address.valid?
    end
    it '県が1だと登録できない事' do
      @order_address.prefecture_id = nil
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Prefecture can't be blank", "Prefecture Prefecture must be other than 1")
    end
    it '市区町村が空だと購入できない事' do
      @order_address.city = nil
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("City can't be blank")
    end
    it '番地が空だと登録できない事' do
      @order_address.address = nil
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Address can't be blank")
    end
    it '建物名は空でも登録できる事' do
      @order_address.building = nil
      expect(@order_address).to be_valid
    end
    it '電話番号が空だと登録できない事' do
      @order_address.phone_number = nil
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Phone number can't be blank")
    end
    it '電話番号は11桁以内である事' do
      @order_address.phone_number = 123456789012
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Phone number is invalid. not needed hyphen.")
    end
    it '電話番号はハイフンが不要な事' do
      @order_address.phone_number = 123-45678901
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Phone number is invalid. not needed hyphen.")
    end
  end
end