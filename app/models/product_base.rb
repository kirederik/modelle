class ProductBase < ActiveRecord::Base
  attr_accessible :name
  
  has_many :products, dependent: :destroy

  validates_presence_of :name

end
