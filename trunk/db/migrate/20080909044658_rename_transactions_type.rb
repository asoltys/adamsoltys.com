class RenameTransactionsType < ActiveRecord::Migration
  def self.up
		rename_column :transactions, :type, :transaction_type
  end

  def self.down
		rename_column :transactions, :transaction_type, :type
  end
end
