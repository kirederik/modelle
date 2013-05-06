class Transaction < ActiveRecord::Base
  belongs_to :customer_stock
  attr_accessible :create_at, :is_devolution, :quantity, :value, :customer_stock_id
end
