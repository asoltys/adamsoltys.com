class Transaction < ActiveRecord::Base
	require 'htmlentities'
	belongs_to :account
	
	def html_encoded_name
		coder = HTMLEntities.new
		coder.encode(name, :named)
	end
end