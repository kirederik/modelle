class Order < ActiveRecord::Base
  belongs_to :customer
  belongs_to :user
  belongs_to :order_status

  has_many :product_orders
  attr_accessible :created_at, :updated_at
end
