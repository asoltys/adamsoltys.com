class RemoveLastKnownPriceFromStocks < ActiveRecord::Migration
  def self.up
		remove_column :stocks, :last_known_price
  end

  def self.down
		add_column :stocks, :last_known_price, :float
  end
end
