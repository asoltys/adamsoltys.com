class CreateTransactions < ActiveRecord::Migration
  def self.up
    create_table :transactions do |t|
			t.date :date
			t.integer :shares
			t.float :price
			t.integer :stock_id
    end
  end

  def self.down
    drop_table :transactions
  end
end
