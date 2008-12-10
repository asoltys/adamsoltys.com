class AlterReviews < ActiveRecord::Migration
  def self.up
    remove_column :reviews, :comments
    remove_column :reviews, :type
    remove_column :reviews, :category_id

    create_table :review_categories do |t|
      t.string :name
    end

    add_column :reviews, :review_category_id, :int
  end

  def self.down
    add_column :reviews, :comments, :text
    add_column :reviews, :type, :string
    add_column :reviews, :category_id, :integer

    drop_table :review_categories

    remove_column :reviews, :review_category_id, :integer
  end
end
