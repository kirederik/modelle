class ProductOrderOut < ActiveRecord::Base
  belongs_to :product_order, :dependent => :destroy
  attr_accessible :quantity, :product_order_id
end
