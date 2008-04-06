set :username, 'adam'
set :password, "MPJzfq97"
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

role :app, "www.adamsoltys.com"
role :web, "www.adamsoltys.com"
role :db,  "www.adamsoltys.com", :primary => true

namespace :deploy do
	desc <<-DESC
    Start the application
  DESC
	task :start, :roles => :app do
		run "ln -fs #{current_path}/config/mongrel_cluster.yml /etc/mongrel_cluster/#{application}.yml && /etc/init.d/mongrel_cluster start"
	end
	
	desc <<-DESC
    Stop the application
  DESC
	task :stop, :roles => :app do
		run "/etc/init.d/mongrel_cluster stop"
	end
end
