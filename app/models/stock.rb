class Stock < ActiveRecord::Base
	require 'hpricot'
	require 'open-uri'
	
	has_many :stock_transactions
	has_many :stock_prices
	belongs_to :account
	
	def price(date = Time.now)
		# Try the database first
		historical_price = stock_prices.first.where('date = ?', date.strftime("%Y-%m-%d"))

		if historical_price && historical_price.price != 0
			@price = historical_price.price
		# Not in database? Try Google Finance historical records.
		else			
			startdate = enddate = date.strftime("%Y-%m-%d")
			
			if date === Time.now
				url = "http://finance.google.com/finance/historical?q=#{symbol}&startdate=#{startdate}&enddate=#{enddate}"
				price_td = Hpricot(open(url)).at("div#prices/table/tr:eq(1)/td:eq(4)")
			end
					
			# Not in the historical records yet?  Use today's quote.
			if !price_td
				url = "http://finance.google.com/finance?q=#{symbol}"
				price_td = Hpricot(open(url)).at("span.pr span")
			end
			
			# Save whatever price we found in the database for faster lookups later
			if price_td
				@price = price_td.inner_html.to_f
				stock_prices.create({:date => date, :price => @price, :stock_id => id})
			else
				@price = 0
			end
		end
		
		@price
	end
end
