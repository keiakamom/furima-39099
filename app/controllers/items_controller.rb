class ItemsController < ApplicationController
  def index
  end

  def item_params
    params.require(:item).permit(:image, :name, :info, :category_id, :status_id, :shipping_fee_id, :prefecture_id, :shipping_date_id, :price).merge(user_id: current_user.id)
  end
end
