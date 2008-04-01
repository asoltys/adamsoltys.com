require 'mongrel_cluster/recipes'

ssh_options[:port] = 443
set :application, "adam_soltys"
set :repository,  "svn://adamsoltys.com/adam_soltys/trunk"

# If you aren't deploying to /u/apps/#{application} on the target
# servers (which is the default), you can specify the actual location
# via the :deploy_to variable:
set :deploy_to, "C:/CFusionMX7/wwwroot/#{application}"

set :mongrel_conf, "#{current_path}/config/mongrel_cluster.yml"

# If you aren't using Subversion to manage your source code, specify
# your SCM below:
# set :scm, :subversion

role :app, "www.adamsoltys.com"
role :web, "www.adamsoltys.com"
role :db,  "www.adamsoltys.com", :primary => true