class Stock < ActiveRecord::Base
	has_many :transactions
	attr_accessor :quote
	
	def quote
		@quote ||= self[:quote] || Quote.new(symbol)
	end
end
