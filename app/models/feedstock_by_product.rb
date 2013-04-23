class FeedstockByProduct < ActiveRecord::Base
  belongs_to :feedstock
  belongs_to :product
  attr_accessible :quantity
end
