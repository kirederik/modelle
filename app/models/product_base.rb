class ProductBase < ActiveRecord::Base
  attr_accessible :name, :code, :price
  
  has_many :products, dependent: :destroy

  validates_presence_of :name, :code, :price

  validates_uniqueness_of :code
end
