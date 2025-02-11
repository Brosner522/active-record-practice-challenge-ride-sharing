class Ride < ActiveRecord::Base
    belongs_to :driver
    belongs_to :passenger

    def print_details
        puts "#{self.driver.first_name} #{self.driver.last_name} drove #{self.passenger.first_name} #{self.passenger.last_name} for $#{self.price} from #{self.pick_up} to #{self.drop_off}"
    end
end