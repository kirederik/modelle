class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  attr_accessible :address, :cel_number, :cep, :city, :cpf, :dateofbirth, :fire_date, :hide_date, :name, :observations, :phone1, :phone2, :rg, :sex, :state, :wage
  attr_accessible :function_id
  
  validates_presence_of :name, :fire_date, :cpf, :rg, :sex, :wage, :dateofbirth

  has_one :function
end
