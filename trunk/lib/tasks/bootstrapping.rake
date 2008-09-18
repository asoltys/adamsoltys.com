require 'fastercsv'

CIBC_CHEQUING = "C:/Documents and Settings/Adam/Desktop/cibc.csv"
COAST_CAPITAL_CHEQUING = "C:/Documents and Settings/Adam/Desktop/statement.csv"
VISA = "C:/Documents and Settings/Adam/Desktop/cibcvisa.csv"
QUESTRADE = "C:/Documents and Settings/Adam/Desktop/questrade.csv"

namespace :adam do
	desc "Clean Files"
	task :clean do
		file = File.new(VISA)
		lines = file.readlines
		file.close
		
		lines.each do |l|
			l.gsub!(/\"/,'')
		end
		
		file = File.new(VISA, 'w')
		lines.each do |l|
			file.write(l)
		end
		file.close
	end
	
	desc "Load all transactions"
	task :load => :environment do
		Transaction.delete_all
		
		# CIBC Chequing Account
		FasterCSV.foreach(CIBC_CHEQUING) do |row|
			t = Transaction.new
			t.date = row[0]
			t.name = row[1]
			t.amount = row[3].to_f - row[2].to_f
			
			t.account = Account.find_by_name("CIBC Chequing Account")
			t.save
		end
		
		# CIBC Dividend VISA
		FasterCSV.foreach(VISA) do |row|
			t = Transaction.new
			t.date = row[0]
			t.name = row[1]
			t.amount = row[3].to_f - row[2].to_f
			
			t.account = Account.find_by_name("CIBC VISA Dividend Card")
			t.save
		end
		
		# QuestTrade Account
		FasterCSV.foreach(QUESTRADE, :headers => :first_row) do |row|
			t = Transaction.new
			t.date = row[1]
			t.name = row[2]
			t.amount = row[4].to_f
			
			if row[5] == 'CAD'
				t.account = Account.find_by_name("QuestTrade Brokerage Account CAD")
			else
				t.account = Account.find_by_name("QuestTrade Brokerage Account USD")
			end
			
			t.save
		end
		
		# CoastCapital Accounts
		FasterCSV.foreach(COAST_CAPITAL_CHEQUING) do |row|
			t = Transaction.new
			
			if row[0] =~ /100/
				t.account = Account.find_by_name("Coast Capital Chequing Account")
			elsif row[0] =~ /701/
				t.account = Account.find_by_type("GIC701")
			elsif row[0] =~ /702/
				t.account = Account.find_by_type("GIC702")
			elsif row[0] =~ /703/
				t.account = Account.find_by_type("GIC703")
			elsif row[0] =~ /704/
				t.account = Account.find_by_type("GIC704")
			else
				next
			end
				
			t.date = row[1]
			t.name = row[2]
			t.amount = row[5].to_f - row[4].to_f
			
			
			t.save
		end
	end
end