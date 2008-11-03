class AlterTransactionType < ActiveRecord::Migration
  def self.up
		change_column :transactions, :transaction_type, :string
  end

  def self.down
		change_column :transactions, :transaction_type, :char
  end
end
