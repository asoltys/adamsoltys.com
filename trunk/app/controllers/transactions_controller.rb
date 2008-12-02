class TransactionsController < ApplicationController
	def new
		@transaction = Transaction.new
	end
	
	def create
    @transaction = Transaction.new(params[:transaction ])

		if @transaction.save
			redirect_to finances_path
		else
			render :action => "new"
    end
  end
	
	def edit
		@transaction = Transaction.find(params[:id])
	end
	
	def update
    @transaction = Transaction.find(params[:id])

		if @transaction.update_attributes(params[:transaction])
			redirect_to finances_path
		else
			render :action => "edit"
    end
  end
	
	def destroy
		Transaction.delete(params[:id])
		redirect_to finances_path
	end
end