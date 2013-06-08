class FilialStock < ActiveRecord::Base
  belongs_to :filial
  belongs_to :product
  attr_accessible :quantity, :product_id, :filial_id

  validates_presence_of :product_id, :filial_id, :quantity
end
