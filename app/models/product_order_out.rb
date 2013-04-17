class ProductOrderOut < ActiveRecord::Base
  
  #belongs_to :product_order, :dependent => :destroy
  belongs_to :production_item
  belongs_to :product
  attr_accessible :quantity, :production_item_id, :product_id
end
