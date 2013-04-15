class ProductionItem < ActiveRecord::Base
  belongs_to :production_status
  belongs_to :order

  has_many :product_order_outs
  # attr_accessible :title, :body
end
