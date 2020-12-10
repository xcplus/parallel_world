# config valid for current version and patch releases of Capistrano
lock "~> 3.14.1"
set :application, "parallel_world"
set :branch, "main"
set :repo_url, "git@github.com:xcplus/parallel_world.git"
set :deploy_to, "/home/ubuntu/parallel_world"
append :linked_files, "config/database.yml", "config/master.key"
append :linked_dirs, "log", "tmp/pids", "tmp/cache", "tmp/sockets", "storage", "public"
set :keep_releases, 10
