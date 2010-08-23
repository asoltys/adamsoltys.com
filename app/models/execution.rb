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
end
