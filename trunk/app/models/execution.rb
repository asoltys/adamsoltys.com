class Execution < ActiveRecord::Base
	belongs_to :stock
	belongs_to :account
	
	def amount
		if execution_type == 'Buy'
			-(price * shares) - commission
		else
			(price * shares) - commission
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