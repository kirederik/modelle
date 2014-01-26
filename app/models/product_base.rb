class ProductBase < ActiveRecord::Base

  attr_accessible :name, :code, :price
  
  has_many :products, dependent: :destroy

  validates_presence_of :name, :code, :price

  validates_uniqueness_of :code

  # puts Barby::Code128B::CODEA.encoding
  # barcode = Barby::Code128B.new('123')
  # File.open('code128B.gif', 'wb'){|f|
  #   f.write barcode.to_gif
  # }
  def barcode
    barcode = Barby::Code128B.new("#{self.code}")
    file_path = "public/barcodes/#{self.code}.gif"
    file_web = "/barcodes/#{self.code}.gif"
    File.open(file_path, 'wb'){|f|
      f.write barcode.to_gif
    }

    file_web
  end
end
