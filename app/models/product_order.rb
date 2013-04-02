class ProductOrder < ActiveRecord::Base
  belongs_to :order
  belongs_to :product

  has_one :product_order_out
  attr_accessible :quantity, :order_id, :product_id, :product_order_out

  validates_presence_of :quantity, :order_id, :product_id
end
