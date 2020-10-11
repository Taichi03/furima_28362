class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:index]
  before_action :set_item, only: [:index, :create]

  def index
    return redirect_to root_path if @item.user_id == current_user.id || @item.order != nil
    @order = OrderAddress.new

  end

  def new
   
  end

  def create
    @order = OrderAddress.new(order_params)
    if @order.valid?
      pay_item
      @order.save
      return redirect_to root_path
    else 
      render 'index'
    end
  end

  private

  def order_params
    params.permit(:token, :postal_code, :city, :address, :building, :phone_number, :prefecture_id, :item_id).merge(user_id: current_user.id)
  end
  

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.item_price,
      card: order_params[:token],
      currency:'jpy'
    )
  end

  def set_item
    @item = Item.find(params[:item_id])
  end 

end
