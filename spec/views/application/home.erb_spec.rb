require File.dirname(__FILE__) + '/../../spec_helper'

describe "home page" do
  before do
    @post = mock_model(Post)
    @post.stub!(:created_at).and_return(Time.now)
    @post.stub!(:title).and_return('First Post')
    @post.stub!(:body).and_return('Blahblahblah')
    assigns[:posts] = [@post]
  end

	it "should have a link to the contact page for suggestions" do
		render "/application/home.erb"
		response.should have_tag('a', 'let me know')
	end
end
