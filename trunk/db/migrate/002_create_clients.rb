class CreateClients < ActiveRecord::Migration
  def self.up
    create_table :clients do |t|
			t.string :first_name
			t.string :last_name
			t.password :password
			t.integer :company_id
      t.timestamps 
    end
  end

  def self.down
    drop_table :clients
  end
end
