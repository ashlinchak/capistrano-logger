namespace :logger do
  desc 'Show logs'
  task :show do
    on roles(:app) do
      default_file = "#{release_path}/log/#{fetch(:rails_env)}.log"
      lines = ENV['LINES'] || fetch(:logger_lines) || 100
      file = default_file

      if ENV['FILE']
        if fetch(:logger_files).is_a?(Hash)
          fetched_file = fetch(:logger_files)[ENV['FILE'].to_sym]
          file = fetched_file if fetched_file
        end
      else
        if fetch(:logger_files).is_a?(Hash)
          file = fetch(:logger_files).values[0]
        elsif fetch(:logger_files).is_a?(String)
          file = fetch(:logger_files)
        end
      end

      SSHKit.config.use_format SSHKit::Formatter::LogFormat
      execute "tail -n #{lines} #{file}"
    end
  end
end
