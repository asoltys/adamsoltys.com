class ReviewsController < ApplicationController
  def index
    @reviews = Review.find(:all)
		respond_appropriately
  end
	
	def new
		@review = Review.new
	end
	
	def create
		@review = Review.new(params[:review])
		@review.save!
		redirect_to reviews_path
	end
end
