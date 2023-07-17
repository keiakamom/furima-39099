class Order < ApplicationRecord
   belings_to :user
   belongs_to :item
   has_one :payment
end
