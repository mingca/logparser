# This test should not take you longer than two hours to complete. 

# What we are looking for: functionality, efficiency, readability and tests
# Use this test to demonstrate your understanding of OO and TDD.


# 1. ruby_app

# Write a ruby script that:

# a. Receives a log as argument (webserver.log is provided)
#   e.g.: ./parser.rb webserver.log

# b. Returns the following:

#   > list of webpages with most page views ordered from most pages views to less page views
#      e.g.:
#          /home 90 visits
#          /index 80 visits
#          etc...
#   > list of webpages with most unique page views also ordered
#      e.g.:
#          /about/2   8 unique views
#          /index     5 unique views
#          etc...


class LogParser
  attr_accessor :log_lines

  def initialize(filename)
    @log_lines = []
    File.open(filename, 'r').each do |line|
      @log_lines << line.split(' ')
    end
  end

  def group_by_url
    @log_lines = log_lines
              .group_by(&:first)
              .inject({}) { |h, (k, v)| h[k] = v.map(&:last); h }
  end

  def less_page_views
    log_lines
      .inject({}) { |h, (k, v)| h[k] = v.count; h }
      .sort_by {|k,v| v}.reverse
  end

  def unique_page_views
    log_lines
      .inject({}) { |h, (k, v)| h[k] = v.uniq.count; h }
      .sort_by {|k,v| v}.reverse
  end

  def parse
    group_by_url

    puts "1. list of webpages with most page views ordered from most pages views to less page views\n\n"
    less_page_views
      .each do |item| 
        printf "%15s %s visits\n",item[0],item[1]
      end

    puts "\n2. list of webpages with most unique page views also ordered\n\n"
    unique_page_views
      .each do |item| 
        printf "%15s %s unique views\n",item[0],item[1]
      end
  end
end
LogParser.new(ARGV[0]).parse unless ARGV[0].nil?

