class AccountsController < ApplicationController
	def show
		@account = Account.find(params[:id])
		if @account.type == 'QuestTrade'
			redirect_to stocks_path
		else
			respond_appropriately
		end
	end
end