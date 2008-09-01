class Stock < ActiveRecord::Base
	require 'hpricot'
	require 'open-uri'
	
	has_many :transactions
	
	def update_last_known_price
		url = "http://finance.google.com/finance?q=#{symbol}"
		price = Hpricot(open(url)).at("span[@class='pr']").inner_html
		write_attribute(:last_known_price, price.to_f)
		save
	end
end
