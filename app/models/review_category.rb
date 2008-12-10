class ReviewCategory < ActiveRecord::Base
  has_many :reviews
end
