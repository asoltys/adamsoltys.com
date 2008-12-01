class CreateStocks < ActiveRecord::Migration
  def self.up
    create_table :stocks do |t|
			t.string :symbol
			t.string :company
    end
  end

  def self.down
    drop_table :stocks
  end
end
