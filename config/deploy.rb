require "rvm/capistrano"
require "bundler/capistrano"

server "192.241.213.52", :web, :app, :db, primary: true

set :application, "abbo"
set :user, "root"
set :deploy_to, "/home/#{user}/apps/#{application}"
set :use_sudo, false

set :scm, :git
set :repository, "file://."
set :branch, "master"
set :deploy_via, :copy


default_run_options[:pty] = true
ssh_options[:forward_agent] = true

after "deploy", "deploy:cleanup" # keep only the last 5 releases
after "deploy", "rvm:trust_rvmrc"

namespace :deploy do
  %w[start stop restart].each do |command|
    desc "#{command} unicorn server"
    task command, roles: :app, except: {no_release: true} do
      run "/etc/init.d/unicorn_#{application} #{command}"
    end
  end

 namespace :rvm do
  task :trust_rvmrc do
    run "rvm rvmrc trust #{release_path}"
  end
 end

  task :setup_config, roles: :app do
    sudo "ln -nfs #{current_path}/config/nginx.conf /etc/nginx/sites-enabled/#{application}"
    sudo "ln -nfs #{current_path}/config/unicorn_init.sh /etc/init.d/unicorn_#{application}"
  end
  after "deploy:setup", "deploy:setup_config"
end