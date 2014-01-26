#encoding: utf-8
class Product < ActiveRecord::Base

  require 'barby'
  require 'barby/outputter/rmagick_outputter'
  require 'barby/barcode/code_128' 

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

  def barcode

    code = self.decode

    barcode = Barby::Code128B.new("#{code}")
    file_path = "public/barcodes/#{code}.gif"
    file_web = "/barcodes/#{code}.gif"
    File.open(file_path, 'wb'){|f|
      f.write barcode.to_gif
    }

    file_web
  end

  def decode
    code = ""
    appendzero = 5 - self.product_base.code.length

    appendzero.times { code += '0'}
    code += self.product_base.code

    case self.color
    when "BEGE", "Bege", "bege"
      code << "01"
    when "PRETO", "Preto", "preto"
      code << "02"
    when "BRANCO", "Branco", "branco"
      code << "03"
    when "ONÇA MESCLADA", "Onça mesclada", "onça mesclada"
      code << "04"
    when "FLORIDO", "Florido", "florido"
      code << "05"
    when "ONÇA", "Onça", "onça"
      code << "06"
    when "BROCADO", "Brocado", "brocado"
      code << "07"
    when "MARRON", "Marron", "marron"
      code << "08"
    when "FLORAL LILÁS", "Floral lilás", "floral lilás"
      code << "09"
    when "COBRA ESTAMPADA", "Cobra estampada", "cobra estampada"
      code << "10"
    when "COBRA CLARA", "Cobra Clara", "cobra clara"
      code << "11"
    when "TIGRESA", "Tigresa", "tigresa"
      code << "12"
    when "JACQUARD DESENHADO", "Jacquard desenhado"
      code << "13"
    when "PRETO BROCADO"
      code << "14"
    when "COBRA"
      code << "15"
    when "RENDADO"
      code << "16"
    else
      code << "00"
    end
    
    case self.size
    when "PP"
      code << "01"
    when "P"
      code << "02"
    when "M"
      code << "03"
    when "G"
      code << "04"
    when "GG"
      code << "05"
    when "36"
      code << "06"
    when "38"
      code << "07"
    when "40"
      code << "08"
    when "42"
      code << "09"
    when "44"
      code << "10"
    when "46"
      code << "11"
    when "48"
      code << "12"
    when "50"
      code << "13"
    when "UNICO"
      code << "14"
    when "XPP"
      code << "15"
    when "XGG"
      code << "16"
    when "ESPECIAL"
      code << "17"
    else
      code << "00"
    end

    code
  end

  
end
