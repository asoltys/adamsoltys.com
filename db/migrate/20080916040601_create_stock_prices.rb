class CreateStockPrices < ActiveRecord::Migration
  def self.up
		create_table :stock_prices do |t|
			t.float :price
			t.date :date
			t.references :stock
		end
  end

  def self.down
		drop_table :stock_prices
  end
end
