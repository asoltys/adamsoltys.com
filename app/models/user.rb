class User < ActiveRecord::Base
  devise :openid_authenticatable

  def self.build_from_identity_url(identity_url)
    User.first
  end

  attr_accessible :email
end
