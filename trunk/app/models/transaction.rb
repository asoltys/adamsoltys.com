class Transaction < ActiveRecord::Base
	belongs_to :stock
			
	def type
		if transaction_type == 'b'
			'Buy'
		else
			'Sell'
		end
	end
	
	def cost
		price * shares
	end
	
	def commission
		if shares < 495
			4.95
		else
			shares / 100
		end
	end
	
	def investment
		if type == 'Buy'
			- (cost - commission)
		else
			cost - commission
		end
	end
end