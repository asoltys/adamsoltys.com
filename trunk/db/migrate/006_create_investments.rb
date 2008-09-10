class CreateInvestments < ActiveRecord::Migration
  def self.up
    create_table :investments do |t|
			t.float :principal
			t.string :type
			t.date :investment_date
			t.date :maturity_date
    end
  end

  def self.down
    drop_table :investments
  end
end
