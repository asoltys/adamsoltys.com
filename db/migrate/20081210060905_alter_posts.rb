class AlterPosts < ActiveRecord::Migration
  def self.up
    create_table :post_categories do |t|
      t.integer :id
      t.string :name
    end

    remove_column :posts, :updated_at
    add_column :posts, :category_id, :integer
  end

  def self.down
    drop_table :post_categories
    add_column :posts, :updated_at, :datetime
    remove_column :posts, :category_id, :integer
  end
end
