class Account < ActiveRecord::Base
	has_many :executions, :foreign_key => "account_id"
	has_many :transactions, :foreign_key => "account_id"
	
	def balance(date = Time.now)
		transactions.inject(0) {|sum,t| sum += t.amount}
	end
	
	def value
		balance
	end
end
