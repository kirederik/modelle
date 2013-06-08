
class ManageFilialStock < ActiveRecord::Base
  belongs_to :product
  belongs_to :filial
  attr_accessible :quantity, :type, :product_id, :filial_id, :created_at


  def attr_ok?
  	if (self.product != nil && self.filial != nil && self.quantity != nil && self.type != nil)
  		true
  	else
  		false
  	end
  end
end
