require File.dirname(__FILE__) + '/../spec_helper'

describe Investment do
	before(:each) do
		@investment = Investment.new(
			:rate => 0.05, 
			:principal => 1000, 
			:investment_date => Date.new(2008, 02, 01),
			:maturity_date => Date.new(2008, 04, 01)
		)
	end
	
	it "should have an amount equal to the principal amount on the date of investment" do
		@investment.worth(@investment.investment_date).should == @investment.principal
	end
end