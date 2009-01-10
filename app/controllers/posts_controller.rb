class PostsController < ApplicationController
  before_filter :login_required, :except => :index

  def index
    @posts = Post.find(:all)
  end

  def show
    @post = Post.find(params[:id])

    respond_appropriately
  end

  def new
    @post = Post.new(:created_at => Time.now.strftime('%m/%d/%Y'))

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

  def destroy 
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to home_path
  end
end
