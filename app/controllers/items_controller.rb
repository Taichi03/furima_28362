class ItemsController < ApplicationController
  before_action :set_item, only: [:edit, :show, :update]
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

  def show
  end

  def edit
  end

  def update
    @item.update(item_params)
    if @item.valid?
     redirect_to root_path
    else
     render :edit
    end
  end
  private

  def item_params
    params.require(:item).permit(:item_name, :image, :item_info, :item_category_id, :item_sales_status_id, :item_shipping_fee_status_id, :item_prefecture_id, :item_scheduled_delivery_id, :item_price).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id]) 
  end
end
