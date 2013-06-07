class FilialStock < ActiveRecord::Base
  belongs_to :filial
  belongs_to :product
  attr_accessible :quantity
end
