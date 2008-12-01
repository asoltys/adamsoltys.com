class AddLastKnownPriceToStocks < ActiveRecord::Migration
  def self.up
    add_column :stocks, :last_known_price, :float
  end

  def self.down
    remove_column :stocks, :last_known_price
  end
end
