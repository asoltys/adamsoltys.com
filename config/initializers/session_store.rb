# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_adam_soltys_session',
  :secret      => 'ee527eaca5ce9a85c029061d2d3ba7a65735ae3547de356d9f37b1fcefc0f15c4b56cc175c504b8e3c1cbe074791e9fdf8e9f66b327ba798ca983e8a9df99a50'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
