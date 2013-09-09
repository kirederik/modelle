class Transaction < ActiveRecord::Base
  belongs_to :customer_stock
  attr_accessible :create_at, :is_devolution, :quantity, :value, :customer_stock_id

  

  	def self.searchReport(customer, type, startdate, enddate)
	  	query_obj =  joins(:customer_stock => :customer)
	  	query_obj =  query_obj.where('customer_id = ? ', customer) unless customer.blank?

		if type == "0"
			devol = nil
		elsif type == "1"
        	devol = 'false'
		else
			devol = 'true'
	    end

	    startdate = DateTime.parse(startdate) unless startdate.blank?
	    enddate = DateTime.parse(enddate) unless enddate.blank?

	  	query_obj =  query_obj.where('is_devolution = ? ', devol) unless devol.blank?
	  	query_obj =  query_obj.where('transactions.created_at >= ? ', startdate) unless startdate.blank?
	  	query_obj =  query_obj.where('transactions.created_at <= ? ', enddate) unless enddate.blank?

	  	query_obj
	end
end
