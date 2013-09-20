#encoding: utf-8
class Product < ActiveRecord::Base
  attr_accessible :product_base_id, :product_color_id, :product_size_id, :color, :size
  attr_accessor :color, :size

  has_many :product_orders
  belongs_to :product_base
  belongs_to :product_color
  belongs_to :product_size
  
  #validates_presence_of :product_color_id, :product_size_id

  def name
    if product_color && product_size
      "#{product_base.code} #{product_base.name} #{product_color.name} #{product_size.name}"
    elsif product_color
      "#{product_base.code} #{product_base.name} #{product_color.name}"
    elsif product_size
      "#{product_base.code} #{product_base.name} #{product_size.name}"
    end
  end

  def color
    "#{product_color.name}" unless self.product_color == nil
  end

  def size
    "#{product_size.name}" unless self.product_size == nil
  end

  def verify_feedstock
    status = []
    feedstocks = FeedstockByProduct.where(product_id: self.id)
    feedstocks.each do |f|
      stock = FeedstockStock.where(feedstock_id: f.feedstock_id).first
      if stock == nil
        status.append "#{self.name} precisa de #{f.feedstock.name} que não está cadastrada no estoque."
      else 
        if stock.quantity < f.quantity
          status.append "Não há #{stock.feedstock.name} suficiente para produzir #{self.name}"
        end
      end
    end
    status
  end
end
