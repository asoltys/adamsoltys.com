class CreateClients < ActiveRecord::Migration
  def self.up
    create_table :clients do |t|
      t.column :first_name, :string
      t.column :last_name, :string
      t.column :company_id, :integer
    end
  end

  def self.down
    drop_table :clients
  end
end
