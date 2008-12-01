class Project < ActiveRecord::Base
	has_many :invoices
end
