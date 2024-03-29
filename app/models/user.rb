class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :recoverable, :trackable, :validatable, :authentication_keys => [:login]

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :login
  attr_accessible :address, :cel_number, :cep, :city, :cpf, :dateofbirth, :fire_date, :hide_date, :name, :observations, :phone1, :phone2, :rg, :sex, :state, :wage
  attr_accessible :function_ids

  validates_presence_of :name, :hide_date, :cpf, :rg, :address, :dateofbirth, :login
  validates_uniqueness_of :login

  #has_many :user_functions
  #has_many :functions, :through => :user_functions
  has_and_belongs_to_many :functions


  def has_function?(function_sym)
    functions.any? { |f| f.name.underscore.to_sym == function_sym }
  end
end




