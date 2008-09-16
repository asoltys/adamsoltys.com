class Position
	attr_accessor :stock, :shares, :price
	
	def cost
		price * shares
	end
	
	def value
		stock.price * shares
	end
	
	def percent_return
		100 * gain / cost
	end
	
	def gain
		value - cost
	end
end