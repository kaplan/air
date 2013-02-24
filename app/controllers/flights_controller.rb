class FlightsController < ApplicationController
  def index
    @flights = Flight.order('number asc').limit(500)
  end
end
