class ProductBase < ActiveRecord::Base
  attr_accessible :name, :code, :price
  
  has_many :products

  validates_presence_of :name, :code
end
