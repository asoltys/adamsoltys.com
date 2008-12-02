class PostsController < ApplicationController
  def new
    @post = Post.new

    respond_appropriately
  end

  def edit
    @post = Post.find(params[:id])
		
		respond_appropriately
  end

  def create
    @post = Post.new(params[:post])

		if @post.save
			redirect_to home_path
		else
			render :action => "new"
    end
  end
	
	def update
    @post = Post.find(params[:id])

		if @post.update_attributes(params[:post])
			redirect_to home_path
		else
			render :action => "edit"
    end
  end
end
