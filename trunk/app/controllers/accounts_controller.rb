class AccountsController < ApplicationController
	def show
		@account = Account.find(params[:id])
		
		if @account.class.to_s == "QuestTrade"
			redirect_to stocks_path(@account)
		else
			respond_appropriately
		end
		
	end
end