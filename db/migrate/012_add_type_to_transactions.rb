class AddTypeToTransactions < ActiveRecord::Migration
  def self.up
    add_column :transactions, :type, :char
  end

  def self.down
    remove_column :transactions, :type
  end
end