class OrdersController < ApplicationController

  def index
    @item = Item.find(params[:item_id])
    @order_payment = OrderPayment.new
  end

  def create
    @item = Item.find(params[:item_id])
    @order_payment = OrderPayment.new(order_params)
    if @order_payment.valid?
      @order_payment.save
      redirect_to root_path
    else  
      render :index
    end 
  end 

  private

  def order_params
    params.require(:order_payment).permit(:postcode, :prefecture_id, :city, :adresses, :building, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id])
  end

end
