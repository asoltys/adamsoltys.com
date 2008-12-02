class ExecutionsController < ApplicationController
	def new
		@execution = Execution.new
	end
	
	def create
    @execution = Execution.new(params[:execution ])

		if @execution.save
			redirect_to finances_path
		else
			render :action => "new"
    end
  end
	
	def edit
		@execution = Execution.find(params[:id])
	end
	
	def update
    @execution = Execution.find(params[:id])

		if @execution.update_attributes(params[:execution])
			redirect_to finances_path
		else
			render :action => "edit"
    end
  end
	
	def destroy
		Execution.delete(params[:id])
		redirect_to finances_path
	end
end