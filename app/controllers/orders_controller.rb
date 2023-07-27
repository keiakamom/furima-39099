class OrdersController < ApplicationController  
  before_action :authenticate_user!
  before_action :set_item, only: [:index, :create]

  def index
    @order_payment = OrderPayment.new
  end

  def create
    @order_payment = OrderPayment.new(order_params)
    if @order_payment.valid?
      pay_item
      @order_payment.save
      redirect_to root_path
    else  
      render :index
    end 
  end 

  private

  def set_item
    @item = Item.find(params[:item_id])
    if @item.order || @item.user.id == current_user.id
    redirect_to root_path
    end
  end

  def order_params
    params.require(:order_payment).permit(:postcode, :prefecture_id, :city, :adresses, :building, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,  # 商品の値段
      card: order_params[:token],    # カードトークン
      currency: 'jpy'                 # 通貨の種類（日本円）
    )
  end

end
