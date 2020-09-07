class ItemsController < ApplicationController
  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def create
   @item = Item.new(item_params)
   if @item.valid?
   @item.save
    redirect_to root_path
   else
    render :new
   end
  end

  private

  def item_params
    params.require(:item).permit(:item_name, :image, :item_info, :item_category_id, :item_sales_status_id, :item_shipping_fee_status_id, :item_prefecture_id, :item_scheduled_delivery_id, :item_price).merge(user_id: current_user.id)
  end


end
