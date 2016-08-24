namespace :logger do
  desc 'Show logs'
  task :show do
    on roles(:app) do
      default_file = fetch(:logger_default_file) || "#{release_path}/log/#{fetch(:rails_env)}.log"
      lines = ENV['LINES'] || fetch(:logger_lines) || 100

      if ENV['ALIASE']
        if fetch(:logger_file_aliases).is_a?(Hash) && fetched_file = fetch(:logger_file_aliases)[ENV['ALIASE'].to_sym]
          file = fetched_file
        else
          raise Capistrano::Logger::Error, 'Aliase for log file is not set.'
        end
      elsif ENV['FILE']
        file = ENV['FILE']
      else
        file = default_file
      end

      SSHKit.config.use_format SSHKit::Formatter::LogFormat
      execute "tail -n #{lines} #{file}"
    end
  end
end
