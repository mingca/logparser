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

$arr = []
File.open(ARGV[0], 'r').each do |line|
  $arr << line.split(' ')
end

url_ip_hash = $arr
              .group_by(&:first)
              .inject({}) { |h, (k, v)| h[k] = v.map(&:last); h }

puts "1. list of webpages with most page views ordered from most pages views to less page views\n\n"
url_ip_hash
  .inject({}) { |h, (k, v)| h[k] = v.count; h }
  .sort_by {|k,v| v}.reverse
  .each do |item| 
    printf "%15s %s visits\n",item[0],item[1]
  end

puts "\n2. list of webpages with most unique page views also ordered\n\n"
url_ip_hash
  .inject({}) { |h, (k, v)| h[k] = v.uniq.count; h }
  .sort_by {|k,v| v}.reverse
  .each do |item| 
    printf "%15s %s unique views\n",item[0],item[1]
  end