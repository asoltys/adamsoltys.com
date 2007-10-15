class CreateInvoices < ActiveRecord::Migration
  def self.up
    create_table :invoices do |t|
      t.column :date, :datetime
      t.column :project_id, :integer
    end
  end

  def self.down
    drop_table :invoices
  end
end
