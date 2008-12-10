class ReviewCategoriesController < ApplicationController
  def index
    @review_categories = ReviewCategory.find(:all)
		respond_appropriately
  end
	
  def new
    @review_category = ReviewCategory.new
    respond_appropriately
  end
	
	def create
		@review_category = ReviewCategory.new(params[:review_category])
		@review_category.save!
		redirect_to review_categories_path
	end
end
