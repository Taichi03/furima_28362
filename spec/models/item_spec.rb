require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '商品出品機能' do
    before do
      @item = FactoryBot.build(:item)
    end  

    it 'すべての値が正しく入力されていれば保存できる' do
        expect(@item).to be_valid
    end
    it 'imageが空だと登録できない事' do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_message).to include(" can't be blank")
    end
    it 'item_nameが空だと登録できない事' do
      @item.item_name = nil
      @item.valid?
      expect(@item.errors.full_message).to include(" can't be blank")
    end
    it 'item_infoが空だと登録できない事' do
      @item.item_info = nil
      @item.valid?
      expect(@item.errors.full_message).to include(" can't be blank")
    end
    it 'item_category_idが空だと登録できない事' do
      @item.item_category_id = nil
      @item.valid?
      expect(@item.errors.full_message).to include(" can't be blank")
    end
    it 'item_category_idが1だと登録できない事' do
      @item.item_category_id = "1"
      @item.valid?
      expect(@item.errors.full_message).to include(" item_category_id is invalid. Input 1 other than characters.")
    end  
    it 'item_salse_status_idが空だと登録できない事' do
      @item.item_salse_status_id = nil
      @item.valid?
      expect(@item.errors.full_message).to include(" can't be blank")
    end
    it 'item_sales_status_idが1だと登録できない事' do
      @item.item_category_id = "1"
      @item.valid?
      expect(@item.errors.full_message).to include(" item_salse_status_id is invalid. Input 1 other than characters.")
    end
    it 'item_shipping_fee_status_idが空だと登録できない事' do
      @item.item_shipping_fee_status_id = nil
      @item.valid?
      expect(@item.errors.full_message).to include(" can't be blank")
    end
    it 'item_shipping_fee_status_idが1だと登録できない事' do
      @item.item_category_id = "1"
      @item.valid?
      expect(@item.errors.full_message).to include(" item_shipping_fee_status_id is invalid. Input 1 other than characters.")
    end
    it 'item_prefecture_idが空だと登録できない事' do
      @item.item_prefecture_id = nil
      @item.valid?
      expect(@item.errors.full_message).to include(" can't be blank")
    end
    it 'item_prefecture_idが1だと登録できない事' do
      @item.item_category_id = "1"
      @item.valid?
      expect(@item.errors.full_message).to include(" item_prefecture_id is invalid. Input 1 other than characters.")
    end
    it 'item_scheduled_delivery_idが空だと登録できない事' do
      @item.item_scheduled_delivery_id = nil
      @item.valid?
      expect(@item.errors.full_message).to include(" can't be blank")
    end
    it 'item_scheduled_delivery_idが1だと登録できない事' do
      @item.item_category_id = "1"
      @item.valid?
      expect(@item.errors.full_message).to include(" item_scheduled_delivery_id is invalid. Input 1 other than characters.")
    end
    it 'item_priceが空だと登録できない事' 
      @item.item_price = nil
      @item.valid?
      expect(@item.errors.full_message).to include(" can't be blank")
    end
    it 'item_priceが半角数字でないと登録できない事' do
      @item.item_price = "１２３４"
      @item.valid?
      expect(@item.errors.full_message).to include("Item_price is invalid. Input half_width characters.")
    end
    it 'item_priceが300以上でないと登録できない事' do
      @item.item_price = "200"
      @item.valid?
      expect(@item.errors.full_message).to include("Item_price is invalid. Input greater than or equal to 300 characters")
    end
end
