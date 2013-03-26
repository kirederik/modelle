class Order < ActiveRecord::Base
  belongs_to :customer
  belongs_to :user
  belongs_to :order_status

  has_many :product_orders, :dependent => :destroy
  
  attr_accessible :created_at, :updated_at, :order_status_id, :customer_id, :user_id, :product_orders_attributes

  validates_presence_of :created_at, :updated_at, :customer_id, :order_status_id, :user_id

  accepts_nested_attributes_for :product_orders
end
