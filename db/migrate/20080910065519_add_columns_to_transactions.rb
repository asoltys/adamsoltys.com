class AddColumnsToTransactions < ActiveRecord::Migration
  def self.up
		add_column :transactions, :account_id, :integer
		add_column :transactions, :name, :string
		add_column :transactions, :amount, :float
	end

  def self.down
		remove_column :transaction, :account_id
		remove_column :transaction, :name
		remove_column :transaction, :amount
  end
end
