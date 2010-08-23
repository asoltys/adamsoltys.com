class AddCommissionToExecutions < ActiveRecord::Migration
  def self.up
    add_column :executions, :commission, :float
  end

  def self.down
    remove_column :executions, :commission
  end
end
