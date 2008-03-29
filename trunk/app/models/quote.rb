class Quote < ActiveResource::Base
	self.site = "http://www.webservicex.net"
	
	def element_path(id, prefix_options = {}, query_options = nil)
		"/stockquote.asmx/GetQuote?symbol=GOOG"
	end
end