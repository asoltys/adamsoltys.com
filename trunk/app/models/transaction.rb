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
	
	def gain
		if type == 'Buy'
			value - cost
		else
			0
		end
	end
	
	def percent_return
		if cost > 0
			100 * gain / cost
		else
			0
		end
	end
	
	def type
		if transaction_type == 'b'
			'Buy'
		else
			'Sell'
		end
	end
end