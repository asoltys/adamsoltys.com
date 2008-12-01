class CreateExecutions < ActiveRecord::Migration
  def self.up
    create_table :executions do |t|
			t.date :date
			t.integer :shares
			t.float :price
			t.string :execution_type
			t.references :stock
			t.references :account
    end
		
		remove_column :transactions, :shares
		remove_column :transactions, :price
		remove_column :transactions, :transaction_type
		remove_column :transactions, :stock_id
  end

  def self.down
    drop_table :executions
		
		add_column :transactions, :shares, :integer
		add_column :transactions, :price, :float
		add_column :transactions, :transaction_type, :string
		add_column :transactions, :stock_id, :integer
  end
end
