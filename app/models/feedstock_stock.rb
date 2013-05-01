class FeedstockStock < ActiveRecord::Base
  belongs_to :feedstock
  attr_accessible :quantity, :feedstock_id

  validates_presence_of :quantity, :feedstock_id
  validates_numericality_of :quantity
  validates_uniqueness_of :feedstock_id
end
