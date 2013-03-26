class CustomerPrice < ActiveRecord::Base
  belongs_to :customer
  belongs_to :product
  attr_accessible :price
  attr_accessible :customer_id, :product_id

  validates_presence_of :customer_id, :product_id, :price
end
