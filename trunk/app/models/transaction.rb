class Transaction < ActiveRecord::Base
	belongs_to :stock

	def cost
		if type == 'Buy'
			price * shares
		else
			0
		end
	end
	
	def value
		stock.last_known_price * shares
	end
			
	def type
		if transaction_type == 'b'
			'Buy'
		else
			'Sell'
		end
	end
	
	def commission
		if shares < 495
			4.95
		else
			shares / 100
		end
	end
	
	def profit
		if type == 'Sell'
			value - cost
		end
	end
end