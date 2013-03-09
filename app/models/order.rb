class Order < ActiveRecord::Base
  belongs_to :customer
  belongs_to :user
  belongs_to :order_status
  attr_accessible :created_at, :updated_at
end
