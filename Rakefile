# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require 'jslint/tasks'
JSLint.config_path = ".jslint.yml"

require File.expand_path('../config/application', __FILE__)

DentalRAG::Application.load_tasks
