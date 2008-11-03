require File.dirname(__FILE__) + '/../../spec_helper'

describe "projects page" do
	before(:each) do
		render "/project/index.erb"
	end
	
	it "should have a title" do
		response.should have_tag('h1', 'Projects')
	end
	
	it "should have a box with dynamic investigations in it" do
		response.should have_tag('div.project')
		response.should have_tag('h2', 'Dynamic Investigations')
	end
end