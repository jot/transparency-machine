# =============================================================================
# ROLES
# =============================================================================
# You can define any number of roles, each of which contains any number of
# machines. Roles might include such things as :web, or :app, or :db, defining
# what the purpose of each machine is. You can also specify options that can
# be used to single out a specific subset of boxes in a particular role, like
# :primary => true.

set :domain, "rewiredstate.inudadev.com"
role :web, "rewiredstate.inudadev.com"
role :app, "rewiredstate.inudadev.com"
role :db,  "rewiredstate.inudadev.com", :primary => true

# ==============================================================================
# REQUIRED VARIABLES
# =============================================================================
# You must always specify the application and repository for every recipe. The
# repository must be the URL of the repository you want this recipe to
# correspond to. The deploy_to path must be the path on each machine that will
# form the root of the application path.

set :application, "rewiredstate"
set :deploy_to, "/var/www/apps/rewiredstate"
set :user, 'deploy'
set :password, "DEPLOY_PASSWORD"
set :runner, 'deploy'
set :sudo, "sudo -p DEPLOY_PASSWORD:"
set :rails_env, "production"

default_run_options[:pty] = true
set :repository,  "git@inuda.unfuddle.com:inuda/rewiredstate.git"
set :scm, "git"
set :scm_password, "NMRNIe" #This is your custom users password
set :scm_user, "inuda_deploy"
set :git_enable_submodules, 1
set :branch, "master"
set :deploy_via, :remote_cache


 
# Automatically symlink these directories from current/public to shared/public.
# set :app_symlinks, %w{photo, document, asset}

# =============================================================================
# APACHE OPTIONS
# =============================================================================
set :apache_server_name, "rewiredstate.inudadev.com"
set :apache_ctl, "/etc/init.d/apache2"
set :apache_proxy_port, 80
set :apache_proxy_servers, 4
set :apache_proxy_address, "127.0.0.1"



# # =============================================================================
# # MONGREL OPTIONS
# # =============================================================================
# set :mongrel_servers, apache_proxy_servers
# set :mongrel_port, 70100
# set :mongrel_address, apache_proxy_address
# set :mongrel_environment, "production"
# set :mongrel_conf, "/etc/mongrel_cluster/rewiredstate.yml"

# =============================================================================
# MYSQL OPTIONS
# =============================================================================


# =============================================================================
# SSH OPTIONS
# =============================================================================
ssh_options[:paranoid] = false


desc "After updating code we need to populate a new database.yml"
task :after_update_code, :roles => :app do
  require "yaml"
  set :production_database_password, proc { Capistrano::CLI.password_prompt("Production database remote Password : ") }

  buffer = YAML::load_file('config/database.example')
  # get ride of uneeded configurations
  buffer.delete('test')
  buffer.delete('development')
  buffer.delete('staging')

  # Populate production element
  buffer['production']['adapter'] = "mysql"
  buffer['production']['database'] = "rewiredstate_production"
  buffer['production']['username'] = "root"
  buffer['production']['password'] = "MYSQL_PASSWORD"
  buffer['production']['host'] = "localhost"

  put YAML::dump(buffer), "#{release_path}/config/database.yml", :mode => 0664
end



# GOD setup
# 
# desc "we call god restart here"
# task :after_start, :roles => :app do
#   
#   #as = fetch(:runner, "app")
#   via = fetch(:run_method, :sudo)
#   invoke_command "sudo god restart npn-mongrels", :via => via
#   invoke_command "sudo apachectl -k restart", :via => via
# end
