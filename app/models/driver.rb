class Driver < ActiveRecord::Base
    has_many :rides
    has_many :passengers, through: :rides
  
    def accept_ride(passenger, pick_up, drop_off, price)
        Ride.create(passenger: passenger, pick_up: pick_up, drop_off: drop_off, price: price, driver: self)
        #since we are in the driver class we can use self to refer to driver.
    end

    def total_income
        self.rides.sum(:price)
    end

    def cancel_ride(passenger)
        ride = Ride.find_by(driver_id: self.id, passenger_id: passenger.id)
        if ride
            ride.destroy
        else
            puts "#{self.first_name} has no scheduled ride with #{passenger.first_name}"
        end
    end

    # class method!
    def self.most_active_driver
        Driver.all.max_by { |driver_inst| driver_inst.rides.count }
    end
end
