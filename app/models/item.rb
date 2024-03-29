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

  with_options presence: true do
    validates :image
    validates :name
    validates :info
    validates :category_id
    validates :status_id
    validates :shipping_fee_id
    validates :prefecture_id
    validates :shipping_date_id
    validates :price, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
  end

  with_options numericality: { other_than: 1, message: "can't be blank" } do
    validates :category_id
    validates :status_id
    validates :shipping_fee_id
    validates :prefecture_id
    validates :shipping_date_id
  end
end
