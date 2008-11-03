class LoginController < ApplicationController
	def index
		@client = Client.new;
	end
end
