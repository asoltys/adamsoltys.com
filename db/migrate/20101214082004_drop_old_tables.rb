class DropOldTables < ActiveRecord::Migration
  def self.up
    drop_table :balances
    drop_table :charges
    drop_table :clients
    drop_table :investments
    drop_table :invoices
    drop_table :post_categories
    drop_table :projects
    drop_table :review_categories
    drop_table :reviews
    drop_table :transactions
    drop_table :users
  end

  def self.down
  end
end
