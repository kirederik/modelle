class ProductStock < ActiveRecord::Base
  belongs_to :product
  attr_accessible :quantity, :product_id

  validates_presence_of :product, :quantity
end
