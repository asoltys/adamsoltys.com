class StockTransaction < Transaction
	belongs_to :stock
	
	def cost
		if type == 'Buy'
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