class CustomerStock < ActiveRecord::Base
  belongs_to :user
  belongs_to :product
  attr_accessible :quantity, :user_id, :product_id

  validates_presence_of :user_id, :product_id, :quantity

  validates_numericality_of :quantity
end
