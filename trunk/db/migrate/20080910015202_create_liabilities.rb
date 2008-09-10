class CreateLiabilities < ActiveRecord::Migration
  def self.up
		create_table :liabilities do |t|
			t.string :type
    end
  end

  def self.down
		drop_table :liabilities
  end
end
