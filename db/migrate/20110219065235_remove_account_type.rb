class RemoveAccountType < ActiveRecord::Migration
  def self.up
    remove_column :accounts, :type
  end

  def self.down
    add_column :accounts, :type, :string
  end
end
