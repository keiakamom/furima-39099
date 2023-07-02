class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  belongs_to :user
  has_one    :order
  has_one_attached :image

  belongs_to :category
  belongs_to :prefecture 
  belongs_to :status 
  belongs_to :shipping_fee 
  belongs_to :shipping_date

end
