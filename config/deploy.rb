require "rvm/capistrano"
require "bundler/capistrano"

server "162.243.240.224", :web, :app, :db, primary: true

set :application, "abbo"
set :user, "deployer"
set :deploy_to, "/home/#{user}/apps/#{application}"
set :deploy_via, :remote_cache
set :use_sudo, false

set :scm, "git"
set :repository, "https://github.com/tititican/Thoda.git"
set :branch, "master"
set :shared_children, shared_children + %w{public/uploads}

after "deploy:restart", "deploy:cleanup"

namespace :deploy do
  task :start do ; end
  task :stop do ; end
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
  end
end

