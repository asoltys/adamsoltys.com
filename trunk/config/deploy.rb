set :application, "adam_soltys"
set :repository,  "svn://adamsoltys.com/adam_soltys/trunk"

ssh_options[:username] = 'adam'

# If you aren't deploying to /u/apps/#{application} on the target
# servers (which is the default), you can specify the actual location
# via the :deploy_to variable:
set :deploy_to, "/var/www/#{application}"

# If you aren't using Subversion to manage your source code, specify
# your SCM below:
# set :scm, :subversion

role :app, "adamsoltys.com"
role :web, "adamsoltys.com"
role :db,  "adamsoltys.com", :primary => true

namespace :deploy do
	desc <<-DESC
    Start the application
  DESC
	task :start, :roles => :app do
		run "/etc/init.d/thin restart"
	end
	
	desc <<-DESC
    Stop the application
  DESC
	task :stop, :roles => :app do
		run "/etc/init.d/thin stop"
	end
	
	desc <<-DESC
    Load fixtures after migrating
  DESC
	task :after_migrate, :roles => :app do
		rake = fetch(:rake, "rake")
    rails_env = fetch(:rails_env, "production")
    migrate_env = fetch(:migrate_env, "")
    migrate_target = fetch(:migrate_target, :latest)

    directory = case migrate_target.to_sym
      when :current then current_path
      when :latest  then current_release
      else raise ArgumentError, "unknown migration target #{migrate_target.inspect}"
      end

    run "cd #{directory}; #{rake} RAILS_ENV=#{rails_env} #{migrate_env} db:fixtures:load"
	end
	
	desc <<-DESC
    Perform an SVN update and clear the cache
  DESC
	task :update, :roles => :app do
		run "cd #{current_path} && svn up"
		run "rm #{current_path}/public/cache/*.html"
	end
end
