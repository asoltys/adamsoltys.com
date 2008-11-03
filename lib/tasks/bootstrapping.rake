require 'fastercsv'
		
namespace :adam do
	namespace :transactions do
	
		TRANSACTIONS_DIRECTORY = "C:/CFusionMX7/wwwroot/adam_soltys/public/transactions/"
		CIBC_CHEQUING = TRANSACTIONS_DIRECTORY + "cibc.csv"
		INVESTORS_EDGE = TRANSACTIONS_DIRECTORY + "investors_edge.csv"
		COAST_CAPITAL_CHEQUING = TRANSACTIONS_DIRECTORY + "statement.csv"
		VISA = TRANSACTIONS_DIRECTORY + "cibcvisa.csv"
		QUESTRADE = TRANSACTIONS_DIRECTORY + "questrade.csv"

		desc "Clean transactions by stripping out double quotes"
		task :clean => :environment do
			Transaction.delete_all
			
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
		task :all => [:clean, :cibc_chequing, :cibc_dividend, :investors_edge, :questrade, :coast_cap]
		
		desc "Load CIBC Chequing account transactions"
		task :cibc_chequing => :environment do	
			# CIBC Chequing Account
			CIBC_CHEQUING_ACCOUNT = Account.find_by_name("CIBC Chequing Account")
			
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
		end
		
		
		desc "Load CIBC Dividend Card transactions"
		task :cibc_dividend => :environment do	
			VISA_ACCOUNT = Account.find_by_name("CIBC VISA Dividend Card")

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
		end
		
		desc "Load CIBC Investor's Edge account transactions"
		task :investors_edge => :environment do	
			# CIBC Investor's Edge
			
			INVESTORS_EDGE_ACCOUNT = Account.find_by_name("CIBC Investor's Edge")
			
			FasterCSV.foreach(INVESTORS_EDGE) do |row|
				t = Transaction.new
				t.date = row[0].gsub(/T:\s(.*)\sS:.*/, '\1')
				t.name = row[2]
				row[5] = row[5].gsub(/,/, '')
				row[5] = row[5].gsub(/\$/, '')
				t.amount = row[5].gsub(/\((.*)\)/,"-\\1").to_f
				
				t.account = INVESTORS_EDGE_ACCOUNT
				t.save
			end
		end
		
		desc "Load QuestTrade transactions"
		task :questrade => :environment do				
			# QuestTrade Account
			
			QUESTRADE_ACCOUNT_CAD = Account.find_by_name("Questrade Brokerage Account CAD")
			QUESTRADE_ACCOUNT_USD = Account.find_by_name("Questrade Brokerage Account USD")
			
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
		end
		
		desc "Load coast capital account transactions"
		task :coast_cap  => :environment do
			# CoastCapital Accounts
			COAST_CAPITAL_CHEQUING_ACCOUNT = Account.find_by_name("Coast Capital Chequing Account")
			
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
