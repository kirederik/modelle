#encoding: utf-8
class ProductOrderOut < ActiveRecord::Base
  
  #belongs_to :product_order, :dependent => :destroy
  belongs_to :production_item
  belongs_to :product
  attr_accessible :quantity, :production_item_id, :product_id

  validates_numericality_of :quantity, :greater_than => 0, :message => "Quantidade para produção deve ser maior que 0"
end
