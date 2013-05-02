#encoding: utf-8
class Product < ActiveRecord::Base
  attr_accessible :name

  has_many :product_orders
  
  validates_presence_of :name

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
