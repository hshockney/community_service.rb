require_relative "community_service.rb"
require "minitest/autorun"
require 'date'

class Main_test < Minitest::Test

	def test_for_hours_remaining
		assert_equal(18.75, hours_remaining(["1000000","Wbg","111-111","","75","56.25","9.16.15","","","","","","","","","Taylor",""]))

	end


	def test_for_days_left
		assert_equal(-31, days_left(["1000000","Wbg","111-1111","","75","56.25","2015-9-16","","","","","","","","","Taylor",""], "2015-10-17"))
		assert_equal(346, days_left(["1000000","Wbg","111-1111","","50","37.5","2016-9-27","","","","","","","","","Taylor",""], "2015-10-17"))
		assert_equal(0, days_left(["1000000","Wbg","111-1111","","50","37.5","2015-10-17","","","","","","","","","Taylor",""], "2015-10-17"))
	end
	

	def test_for_risk_rating
		assert_equal("High Risk", risk_factor(12.5,-8,["1000000","Wbg","111-1111","","50","37.5","2015-10-17","","","","","","","","","Taylor",""]))
		assert_equal("Hours Completed", risk_factor(0.0,23,["1000000","Wbg","111-1111","","50","50","2015-11-17","","","","","","","","","Taylor",""]))
		assert_equal("Missing Data", risk_factor(50,23,["1000000","Wbg","111-1111","","50",nil,"2015-11-17","","","","","","","","","Taylor",""]))
		assert_equal("Missing Data", risk_factor(-50,23,["1000000","Wbg","111-1111","",nil,"50","2015-11-17","","","","","","","","","Taylor",""]))
		assert_equal("Missing Data", risk_factor(0,23,["1000000","Wbg","111-1111","","50","50","70-1-1","","","","","","","","","Taylor",""]))
		assert_equal(0.43,risk_factor(10,23,["1000000","Wbg","111-1111","","50","40","2015-11-17","","","","","","","","","Taylor",""]))
	end
	def test_converting_date
		assert_equal(["1000000","Wbg","111-1111","","75","56.25","15-9-16","","","","","","","","","Taylor",""],convert_date_format(["1000000","Wbg","111-1111","","75","56.25","9.16.15","","","","","","","","","Taylor",""]))
	end
	
	def test_get_new_date_format
		assert_equal("15-9-16",get_new_date_format("9.16.15"))
		assert_equal("70-1-1",get_new_date_format(nil))
		assert_equal("70-1-1", get_new_date_format("?.?.22"))
		end
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
end