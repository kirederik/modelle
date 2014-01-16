class ProductionHistory < ActiveRecord::Base
  belongs_to :production_item
  belongs_to :status_from, :class_name => "ProductionStatus"
  belongs_to :status_to, :class_name => "ProductionStatus"
  attr_accessible :status_from_id, :status_to_id, :production_item_id, :created_at
end
