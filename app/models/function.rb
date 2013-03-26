class Function < ActiveRecord::Base
  attr_accessible :name

  #has_many :user_functions
  #has_many :users, :through => :user_functions
  has_and_belongs_to_many :users

  validates_presence_of :name
end
