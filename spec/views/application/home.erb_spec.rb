require File.dirname(__FILE__) + '/../../spec_helper'

describe "home page" do
	it "should have a link to the contact page for suggestions" do
		render "/application/home.erb"
		response.should have_tag('a', 'let me know')
	end
end