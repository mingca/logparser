require_relative "log_parser"

LogParser.new(ARGV[0]).parse unless ARGV[0].nil?
