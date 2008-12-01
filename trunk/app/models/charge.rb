class Charge < ActiveRecord::Base
	belongs_to :client
	has_one :invoice
end
