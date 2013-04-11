class ProductionItem < ActiveRecord::Base
  belongs_to :production_status
  belongs_to :order
  # attr_accessible :title, :body
end
