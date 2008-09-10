class RedeemableGIC < Investment
	def value(date = Time.now)
		rate = 3.15 / 100
		principal + principal * rate
	end
end