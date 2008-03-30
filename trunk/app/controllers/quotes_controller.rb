class QuotesController < ApplicationController
	def new
		@quote = Quote.new params[:symbol]

		respond_to do |format|
			format.xml { render :xml => @quote.to_xml }
		end
	end
end