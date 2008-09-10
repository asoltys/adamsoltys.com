class Account < ActiveRecord::Base
	has_many :balances
	
	def value(date = Time.now)
		0
	end
end