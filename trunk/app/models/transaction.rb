class Transaction < ActiveRecord::Base
	belongs_to :stock
		
	def company
		stock.company
	end
	
	def symbol
		stock.symbol
	end
	
	def current_price
		stock.quote.price.to_f
	end
	
	def cost
		price * shares
	end
	
	def value
		current_price * shares
	end
	
	def gain
		value - cost
	end
end
