class ProductionItem < ActiveRecord::Base
  belongs_to :production_status
  belongs_to :order

  has_many :product_order_outs
  
  attr_accessible :production_status_id

  validates_presence_of :production_status_id
end
