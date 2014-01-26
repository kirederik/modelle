module OrdersHelper
	def build_criteria params

		puts params
		criteria = ""
		if params[:order_status_id] != ""
			criteria += " and order_status_id = #{params[:order_status_id]}"
		end
		if params[:startdate] != "" && params[:enddate] != ""
			
			startdate = params[:startdate]
			enddate = params[:enddate]

			sdate = Date.new(startdate.byteslice(6, 4).to_i, startdate.byteslice(3, 2).to_i, startdate.byteslice(0, 2).to_i).to_time

			edate = Date.new(enddate.byteslice(6, 4).to_i, enddate.byteslice(3, 2).to_i, enddate.byteslice(0, 2).to_i).to_time

			puts sdate.strftime("%Y-%m-%d %T")

			criteria += " and created_at between '#{sdate.strftime("%Y-%m-%d %T")}' and '#{edate.strftime("%Y-%m-%d %T")}' "
		end

		criteria
	end
end
