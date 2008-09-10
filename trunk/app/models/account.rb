class Account < ActiveRecord::Base
	has_many :balances
	
	def worth(date = Time.now)
		50
	end
end