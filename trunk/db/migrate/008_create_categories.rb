class CreateCategories < ActiveRecord::Migration
  def self.up
    create_table :categories do |t|
			t.string :name
    end
		
		add_column :reviews, :category_id, :integer
  end

  def self.down
    drop_table :categories
		remove_column :reviews, :category_id
  end
end
