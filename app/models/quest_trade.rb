class QuestTrade < Account
	has_many :executions, :foreign_key => "account_id"
	
	def stocks
		executions.collect { |e| e.stock }.uniq
	end
	
	def buy_executions
		executions.select { |e| e.execution_type == 'Buy' }
	end
	
	def sell_executions
		executions.select { |e| e.execution_type == 'Sell' }
	end
	
	def positions
		positions = []
		
		stocks.each do |s|
			bought_shares = sold_shares = cost = 0

			p = Position.new
			p.stock = s

			buy_executions = executions.select { |e| e.stock.symbol === s.symbol && e.execution_type == 'Buy' }
			sell_executions = executions.select { |e| e.stock.symbol === s.symbol && e.execution_type == 'Sell' }

			buy_executions.each { |e| bought_shares += e.shares; cost -= e.amount }
			sell_executions.each { |e| sold_shares += e.shares; }
					
			p.shares = bought_shares - sold_shares
			
			if p.shares > 0
				p.price = cost / bought_shares
				positions.push(p)
			end
		end
		
		positions
	end
	
	def commission
		executions.inject(0) {|sum,e| sum += e.commission }
	end

	def market_value
		positions.inject(0) {|sum,p| sum += p.value }
	end
	
	def value(date = Time.now)
		market_value + gain - commission
	end
	
	def cost
		buy_executions.inject(0) {|sum,e| sum -= e.amount } - commission
	end
	
	def gain
		sell_executions.inject(0) {|sum,e| sum += e.amount } - commission
	end
	
	def profit
		market_value + (balance - commission)
	end
	
	def balance
		executions.inject(0) {|sum,e| sum += e.amount }
	end
	
	def percent_return
		if cost != 0
			100 * profit / cost
		else
			0
		end
	end
end