class ProductOrder < ActiveRecord::Base
  belongs_to :order
  belongs_to :product

  has_one :product_order_out, :dependent => :destroy
  attr_accessible :quantity, :order_id, :product_id

  validates_presence_of :quantity, :product_id
end
