class Order < ActiveRecord::Base
  belongs_to :customer
  belongs_to :user
  belongs_to :order_status

  has_many :product_orders
  attr_accessible :created_at, :updated_at, :order_status_id, :customer_id, :user_id

  validates_presence_of :created_at, :updated_at, :customer_id, :order_status_id, :user_id

  def product_order_attributes(product_order_attributes)
    product_order_attributes.each do |attributes|
      product_orders.build(attributes)
    end
  end
end
