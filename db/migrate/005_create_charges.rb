class CreateCharges < ActiveRecord::Migration
  def self.up
    create_table :charges do |t|
			t.date :date
			t.integer :hours
			t.string :service
			t.integer :invoice_id
			t.integer :client_id
      t.timestamps 
    end
  end

  def self.down
    drop_table :charges
  end
end
