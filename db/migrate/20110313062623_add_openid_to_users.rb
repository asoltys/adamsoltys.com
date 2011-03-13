class AddOpenidToUsers < ActiveRecord::Migration
  def self.up
    change_table :users do |t|
      t.openid_authenticatable
    end
    add_index :users, :identity_url, :unique => true
  end

  def self.down
    remove_index :users, :identity_url
  end
end
