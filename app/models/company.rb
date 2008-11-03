class Company < ActiveRecord::Base
	has_many :clients
end