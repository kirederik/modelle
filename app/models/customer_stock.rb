class CustomerStock < ActiveRecord::Base
  belongs_to :customer
  belongs_to :product
  has_many :transaction
  attr_accessible :quantity, :customer_id, :product_id


  validates_presence_of :customer_id, :product_id, :quantity

  validates_numericality_of :quantity
end
