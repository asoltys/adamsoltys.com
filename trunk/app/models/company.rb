class Company < ActiveRecord::Base
  has_many :projects
  has_many :clients
end
