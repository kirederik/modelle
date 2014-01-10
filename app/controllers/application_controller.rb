class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :authenticate_user!


	require 'barby'
	require 'barby/barcode/code_128' 
	require 'barby/outputter/rmagick_outputter'
	puts Barby::Code128B::CODEA.encoding
  barcode = Barby::Code128B.new('123')
	File.open('code128B.gif', 'wb'){|f|
	  f.write barcode.to_gif
	}
end
