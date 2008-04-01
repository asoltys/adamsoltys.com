ssh_options[:port] = 443
:password = 'MPJzfq97'
set :application, "adam_soltys"
set :repository,  "svn://adamsoltys.com/adam_soltys/trunk"

# If you aren't deploying to /u/apps/#{application} on the target
# servers (which is the default), you can specify the actual location
# via the :deploy_to variable:
set :deploy_to, "C:/Inetpub/wwwroot/#{application}"

# If you aren't using Subversion to manage your source code, specify
# your SCM below:
# set :scm, :subversion

role :app, "www.adamsoltys.com"
role :web, "www.adamsoltys.com"
role :db,  "www.adamsoltys.com", :primary => true

task :spinner, :roles => :app do
  run "mongrel_rails start -e production -p 3005 -d -c #{current_path}"
end
