class CreateAccounts < ActiveRecord::Migration
  def self.up
		create_table :accounts do |t|
			t.string :name
			t.string :type # used for single-table-inheritance (e.g. VISAAccount, QuestTradeAccount)
			t.string :account_type # either asset or liability
    end
  end

  def self.down
		drop_table :accounts
  end
end
