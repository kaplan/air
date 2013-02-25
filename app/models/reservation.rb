class Reservation < ActiveRecord::Base

  attr_accessible :creditcard, :flight_id, :user_id

  belongs_to :flight

end
