class Product < ActiveRecord::Base
  attr_accessible :name

  has_many :product_orders
  validates_presence_of :name
end
