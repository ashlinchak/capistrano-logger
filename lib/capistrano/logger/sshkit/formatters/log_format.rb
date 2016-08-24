require 'sshkit/formatters/pretty'

module SSHKit
  module Formatter
    class LogFormat < Pretty

      alias pretty_colorize colorize
      def colorize(obj, _color, _mode = nil)
        obj.to_s
      end

      def format_message(_verbosity, message, _uuid=nil)
        message
      end

      def log_command_start(command)
        host_prefix = command.host.user ? "as #{pretty_colorize(command.host.user, :blue)}@" : 'on '
        message = "Running #{pretty_colorize(command, :yellow, :bold)} #{host_prefix}#{pretty_colorize(command.host, :blue)}"
        write_message(command.verbosity, message, command.uuid)
      end

      def log_command_exit(command)
      end
    end
  end
end
