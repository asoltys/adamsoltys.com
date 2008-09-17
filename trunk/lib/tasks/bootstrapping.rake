require 'fastercsv'

namespace :adam do  
	desc "Load all transactions"
	task :load => :environment do
		
		# CIBC Chequing Account
		FasterCSV.foreach("C:/Documents and Settings/Adam/Desktop/cibc.csv") do |row|
			t = Transaction.new
			t.date = row[0]
			t.name = row[1]
			t.amount = row[3].to_f - row[2].to_f
			
			t.account = Account.find_by_name("CIBC Chequing Account")
			t.save
		end
		
	end
end