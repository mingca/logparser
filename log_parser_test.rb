require_relative "log_parser"
require "test/unit"
 
class TestLogParser < Test::Unit::TestCase
 
	def setup
		@parser = LogParser.new('test_log.log')
	end

	def test_parser
		assert_not_nil @parser
		assert_raise Errno::ENOENT do
			LogParser.new('non_exist.log')
		end
	end
 
 	def test_group_by_url
 		assert @parser.group_by_url
 	end

 	def test_less_page_views
 		@parser.group_by_url
 		assert @parser.less_page_views
 	end

 	def test_unique_page_views
 		@parser.group_by_url
 		assert @parser.unique_page_views
 	end
end