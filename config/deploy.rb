default_run_options[:pty] = true
set :application, "delono.com"
set :repository,  "git@github.com:mettadore/delono.git"

set :scm, "git"
set :scm_passphrase, "Un+c2WFeH"
set :user, "deployer"
ssh_options[:forward_agent] = true

set :use_sudo, false
set :branch, "master"
set :repository_cache, "git_cache"
set :deploy_via, :copy

set :deploy_to, "/webapps/delono"

role :web, application                          # Your HTTP server, Apache/etc
role :app, application                          # This may be the same as your `Web` server
role :db,  application, :primary => true # This is where Rails migrations will run

# If you are using Passenger mod_rails uncomment this:
# if you're still using the script/reapear helper you will need
# these http://github.com/rails/irs_process_scripts

namespace :deploy do
  desc "Restarting mod_rails with restart.txt"
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "touch #{File.join(current_path,'tmp','restart.txt')}"
  end
  [:start, :stop].each do |t|
    desc "#{t} task is a no-op with mod_rails"
    task t, :roles => :app do; end
  end
  desc "Link in the production database.yml" 
  task :after_update_code do
    run "ln -nfs #{deploy_to}/#{shared_dir}/config/database.yml #{release_path}/config/database.yml" 
    run "mkdir #{release_path}/log && touch #{release_path}/log/production.log"
  end

end

