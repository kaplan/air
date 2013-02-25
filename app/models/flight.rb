class Flight < ActiveRecord::Base
  attr_accessible :arrival_airport, :departs_at, :departure_airport, :miles, :number, :seats

  def duration
    miles / 8
  end

  def arrives_at
    departs_at + duration.minutes
  end

  has_many :reservations

end
