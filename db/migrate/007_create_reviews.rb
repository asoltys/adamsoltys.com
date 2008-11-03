class CreateReviews < ActiveRecord::Migration
  def self.up
    create_table :reviews do |t|
			t.string :title
			t.integer :rating
			t.text :comments
			t.string :type
    end
  end

  def self.down
    drop_table :reviews
  end
end
