class CreateInvoices < ActiveRecord::Migration
  def self.up
    create_table :invoices do |t|
			t.integer :project_id
			t.date :date
      t.timestamps 
    end
  end

  def self.down
    drop_table :invoices
  end
end
