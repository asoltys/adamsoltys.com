require 'fastercsv'

namespace :adam do
	namespace :transactions do
		desc "Clean transactions by stripping out double quotes"
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
			CIBC_CHEQUING = "C:/Documents and Settings/Adam/Desktop/cibc.csv"
			COAST_CAPITAL_CHEQUING = "C:/Documents and Settings/Adam/Desktop/statement.csv"
			VISA = "C:/Documents and Settings/Adam/Desktop/cibcvisa.csv"
			QUESTRADE = "C:/Documents and Settings/Adam/Desktop/questrade.csv"
			
			CIBC_CHEQUING_ACCOUNT = Account.find_by_name("CIBC Chequing Account")
			COAST_CAPITAL_CHEQUING_ACCOUNT = Account.find_by_name("Coast Capital Chequing Account")
			VISA_ACCOUNT = Account.find_by_name("CIBC VISA Dividend Card")
			QUESTRADE_ACCOUNT_CAD = Account.find_by_name("Questrade Brokerage Account CAD")
			QUESTRADE_ACCOUNT_USD = Account.find_by_name("Questrade Brokerage Account USD")

			Transaction.delete_all
			
			# CIBC Chequing Account
			
			t = Transaction.new		
			t.amount = 5575.12
			t.name = 'Last Known Balance'
			t.date = '2007-08-29'
			t.account = CIBC_CHEQUING_ACCOUNT
			t.save
			
			FasterCSV.foreach(CIBC_CHEQUING) do |row|
				t = Transaction.new
				t.date = row[0]
				t.name = row[1]
				t.amount = row[3].to_f - row[2].to_f
				
				t.account = CIBC_CHEQUING_ACCOUNT
				t.save
			end
			
			t = Transaction.new		
			t.amount = -1276.48
			t.name = 'Last Known Balance'
			t.date = '2007-08-29'
			t.account = VISA_ACCOUNT
			t.save
			
			# CIBC Dividend VISA
			FasterCSV.foreach(VISA) do |row|
				t = Transaction.new
				t.date = row[0]
				t.name = row[1]
				t.amount = row[3].to_f - row[2].to_f
				
				t.account = VISA_ACCOUNT
				t.save
			end
			
			# QuestTrade Account
			FasterCSV.foreach(QUESTRADE, :headers => :first_row) do |row|
				t = Transaction.new
				t.date = row[1]
				t.name = row[2]
				t.amount = row[4].to_f
				
				if row[5] == 'CAD'
					t.account = QUESTRADE_ACCOUNT_CAD
				else
					t.account = QUESTRADE_ACCOUNT_USD
				end
				
				t.save
			end
			
			# CoastCapital Accounts
			FasterCSV.foreach(COAST_CAPITAL_CHEQUING) do |row|
				t = Transaction.new
				
				if row[0] =~ /100/
					t.account = COAST_CAPITAL_CHEQUING_ACCOUNT
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
end