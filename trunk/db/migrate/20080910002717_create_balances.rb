class CreateBalances < ActiveRecord::Migration
  def self.up
		create_table :balances do |t|
			t.float :balance
			t.references :account
    end
  end

  def self.down
		drop_table :balances
  end
end
