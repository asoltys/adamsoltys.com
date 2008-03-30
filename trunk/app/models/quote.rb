class Quote
	require 'rubygems'
	require 'hpricot'
	require 'open-uri'
	
	include ROXML
	xml_text :symbol
	xml_text :price
	
	def initialize(symbol)
		@symbol = symbol
		@url = "http://finance.google.com/finance?q=#{symbol}&hl=en";
		@hp = Hpricot(open(@url));
		@price = @hp.at("span[@class='pr']").inner_html
	end
end