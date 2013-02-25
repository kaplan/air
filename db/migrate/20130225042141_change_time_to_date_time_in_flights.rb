class ChangeTimeToDateTimeInFlights < ActiveRecord::Migration

  def change
    change_column :flights, :departs_at, :datetime
  end

end
