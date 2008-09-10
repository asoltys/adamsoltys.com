class Account < ActiveRecord::Base
	has_many :transactions
	
	def value(date = Time.now)
		0
	end
end