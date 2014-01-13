class ProductStock < ActiveRecord::Base
  belongs_to :product
  attr_accessible :quantity, :product_id, :quantity_stock, :quantity_production

  validates_presence_of :product, :quantity
  validates_uniqueness_of :product_id
end
