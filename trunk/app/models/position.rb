class Position
	attr_accessor :stock, :shares
	
	def percent_return
		if cost > 0
			100 * gain / cost
		else
			0
		end
	end
	
	def gain
		if type == 'Buy'
			value - cost
		else
			0
		end
	end
end