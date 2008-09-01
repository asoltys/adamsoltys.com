class Transaction < ActiveRecord::Base
	belongs_to :stock

	def cost
		price * shares
	end
	
	def value
		stock.last_known_price * shares
	end
	
	def gain
		value - cost
	end
end
