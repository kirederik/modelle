class ProductOrderOut < ActiveRecord::Base
  
  #belongs_to :product_order, :dependent => :destroy
  belongs_to :production_item
  attr_accessible :quantity, :product_order_id, :production_item_id
end
