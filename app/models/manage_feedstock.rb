class ManageFeedstock < ActiveRecord::Base
  belongs_to :feedstock
  attr_accessible :action_type, :quantity, :feedstock_id, :created_at

	def attr_ok?
  	if (self.feedstock != nil && self.quantity != nil && self.action_type != nil)
  		true
  	else
  		false
  	end
  end
end
