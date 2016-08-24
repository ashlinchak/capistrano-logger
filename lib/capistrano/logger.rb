require 'capistrano/logger/version'
require 'capistrano/logger/error'
load File.expand_path('../logger/tasks/logger.rake', __FILE__)
load File.expand_path('../logger/sshkit/formatters/log_format.rb', __FILE__)
