class ProjectsController < ApplicationController
	caches_page :index
	
  def index
		respond_appropriately
  end
end

