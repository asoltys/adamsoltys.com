# Be sure to restart your server when you modify this file

# Uncomment below to force Rails into production mode when
# you don't control web/app server and can't set it the proper way
# ENV['RAILS_ENV'] ||= 'production'

# Specifies gem version of Rails to use when vendor/rails is not present
RAILS_GEM_VERSION = '2.1.1' unless defined? RAILS_GEM_VERSION

# Bootstrap the Rails environment, frameworks, and default configuration
require File.join(File.dirname(__FILE__), 'boot')

Rails::Initializer.run do |config|
	config.gem "fastercsv"
	config.gem "htmlentities"

	config.action_controller.page_cache_directory = RAILS_ROOT + "/public/cache/"

  config.action_controller.session = {
    :session_key => '_adam_billing_session',
    :secret      => '3f8438829100c0cf5f5a5ed73c0ba3792bd5dd1c0988b01bbe28998d2b21d8fdc0fd77d0a227d236443ee1307647cfd935b81524ba054c79cd381ac65467d370'
  }
end