class Investment < Asset
	# Child classes should override this
	def value(date = Time.now)
		principal
	end
end
