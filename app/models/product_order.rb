class ProductOrder < ActiveRecord::Base
  belongs_to :order
  belongs_to :product

  #has_one :product_order_out, :dependent => :destroy
  attr_accessible :quantity, :order_id, :product_id, :status

  validates_presence_of :quantity, :product_id
  validates_numericality_of :quantity

  def products_missing
    
    p_stock = ProductStock.where(product_id: self.product_id).first


    if p_stock == nil
      return -1;
    end

    if p_stock.quantity < self.quantity
      return (self.quantity - p_stock.quantity)
    else
      return 0
    end
  

    return 0
  end
end
