require_relative "community_service.rb"
require "minitest/autorun"

class Main_test < Minitest::Test

	def test_for_hours_remaining
		assert_equal(18.75, hours_remaining(["1000000","Wbg","111-111","","75","56.25","9.16.15","","","","","","","","","Taylor",""]))

	end


	def test_for_days_left
		assert_equal(-31, days_left(["1000000","Wbg","111-111","","75","56.25","9.16.15","","","","","","","","","Taylor",""]))
	end

end