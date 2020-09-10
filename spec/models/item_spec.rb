require 'rails_helper'

RSpec.describe Item, type: :model do
    before do
      @item = FactoryBot.build(:item)
    end  
    describe '商品出品機能' do

    it 'すべての値が正しく入力されていれば保存できる' do
        expect(@item).to be_valid
    end
    it 'imageが空だと登録できない事' do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Image can't be blank")
    end
    it 'item_nameが空だと登録できない事' do
      @item.item_name = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Item name can't be blank")
    end
    it 'item_infoが空だと登録できない事' do
      @item.item_info = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Item info can't be blank")
    end
    it 'item_category_idが空だと登録できない事' do
      @item.item_category_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Item category can't be blank", "Item category is not a number")
    end
    it 'item_category_idが1だと登録できない事' do
      @item.item_category_id = "1"
      @item.valid?
      expect(@item.errors.full_messages).to include("Item category must be other than 1")
    end  
    it 'item_sales_status_idが空だと登録できない事' do
      @item.item_sales_status_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Item sales status can't be blank", "Item sales status is not a number")
    end
    it 'item_sales_status_idが1だと登録できない事' do
      @item.item_sales_status_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Item sales status must be other than 1")
    end
    it 'item_shipping_fee_status_idが空だと登録できない事' do
      @item.item_shipping_fee_status_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Item shipping fee status can't be blank")
    end
    it 'item_shipping_fee_status_idが1だと登録できない事' do
      @item.item_category_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Item category must be other than 1")
    end
    it 'item_prefecture_idが空だと登録できない事' do
      @item.item_prefecture_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Item prefecture can't be blank", "Item prefecture is not a number")
    end
    it 'item_prefecture_idが1だと登録できない事' do
      @item.item_category_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Item category must be other than 1")
    end
    it 'item_scheduled_delivery_idが空だと登録できない事' do
      @item.item_scheduled_delivery_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Item scheduled delivery can't be blank", "Item scheduled delivery is not a number")
    end
    it 'item_scheduled_delivery_idが1だと登録できない事' do
      @item.item_category_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Item category must be other than 1")
    end
    it 'item_priceが空だと登録できない事' do
      @item.item_price = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Item price can't be blank", "Item price is not a number", "Item price is invalid. Input half-width.")
    end
    it 'item_priceが半角数字でないと登録できない事' do
      @item.item_price = "１２３４"
      @item.valid?
      expect(@item.errors.full_messages).to include("Item price is not a number", "Item price is invalid. Input half-width.")
    end
    it 'item_priceが300以上でないと登録できない事' do
      @item.item_price = "200"
      @item.valid?
      expect(@item.errors.full_messages).to include("Item price must be greater than or equal to 300")
    end
    it 'item_priceが9999999以下でないと登録できない事' do
      @item.item_price = "99999999"
      @item.valid?
      expect(@item.errors.full_messages).to include("Item price must be less than or equal to 9999999")
    end
  end
end
