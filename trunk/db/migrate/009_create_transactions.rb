class CreateTransactions < ActiveRecord::Migration
  def self.up
    create_table :transactions do |t|
			t.date :date
			t.string :symbol
			t.string :company
			t.integer :shares
			t.float :price
    end
  end

  def self.down
    drop_table :transactions
  end
end
