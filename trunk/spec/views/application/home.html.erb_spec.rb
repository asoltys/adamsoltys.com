require File.dirname(__FILE__) + '/../../spec_helper'

describe "home page" do
	it "should display the title of the application" do
		response.should have_tag('a', 'Adam Soltys')
	end
end