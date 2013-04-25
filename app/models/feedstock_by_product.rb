class FeedstockByProduct < ActiveRecord::Base
  belongs_to :feedstock
  belongs_to :product
  attr_accessible :quantity, :feedstock_id, :product_id

  validates_presence_of :quantity
end
