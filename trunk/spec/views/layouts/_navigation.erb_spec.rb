require File.dirname(__FILE__) + '/../../spec_helper'

describe "navigation" do
	it "should have a link to each of the main pages of the site" do
		render "/layouts/_navigation.erb"
		response.should have_tag('a[href=?]', home_path, 'Home')
		response.should have_tag('a[href=?]', lists_path, 'Lists')
		response.should have_tag('a[href=?]', projects_path, 'Projects')
		response.should have_tag('a[href=?]', resume_path, 'Resume')
		response.should have_tag('a[href=?]', contact_path, 'Contact')
		response.should have_tag('a[href=?]', 'http://blog.adamsoltys.com', 'Blog')
	end
end