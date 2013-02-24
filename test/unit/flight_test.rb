require 'test_helper'

class FlightTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "A flight from ORD to JFK takes 92 minutes" do
    f = Flight.new
    f.departure_airport = "ORD"
    f.arrival_airport = "JFK"
    f.miles = 740
    assert_equal 92, f.duration
  end

end
