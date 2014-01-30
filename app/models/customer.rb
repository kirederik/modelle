class Customer < ActiveRecord::Base
  attr_accessible :addres, :city, :cpf_cnpj, :email, :fax, :mobile, :municipal_number, 
  	:name, :observations, :phone1, :phone2, :state, :suframa, :tribute, :discount
  attr_accessible  :user_id
  
  belongs_to :user

  validates_presence_of :cpf_cnpj, :name, :phone1, :addres

  def apply_discount
  	if self.discount
  		self.discount
  	else
  		0
  	end
  end
end
