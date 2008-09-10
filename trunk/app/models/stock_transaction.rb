class StockTransaction < Transaction
	belongs_to :stock
	belongs_to :quest_trade
	
	def cost
		if transaction_type == 'Buy'
			(price * shares) + commission
		else
			-(price * shares) + commission
		end
	end
	
	def commission
		if shares < 495
			4.95
		else
			shares / 100
		end
	end
end