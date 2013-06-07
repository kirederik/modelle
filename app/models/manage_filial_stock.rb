class ManageFilialStock < ActiveRecord::Base
  belongs_to :product
  belongs_to :filial
  attr_accessible :quantity, :type
end
