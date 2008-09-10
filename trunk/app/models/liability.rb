class Liability < ActiveRecord::Base
	# Child classes should override this
	def value(date = Time.now)
		principal
	end
end