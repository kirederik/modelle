class ProductionItem < ActiveRecord::Base
  belongs_to :production_status
  belongs_to :order

  has_many :product_order_outs, :dependent => :destroy
  has_many :production_histories, :dependent => :destroy
  
  attr_accessible :production_status_id, :order_id, :product_order_outs_attributes

  accepts_nested_attributes_for :product_order_outs

  validates_presence_of :production_status_id
end
