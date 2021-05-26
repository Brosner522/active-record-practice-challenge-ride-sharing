class Passenger < ActiveRecord::Base
    has_many :rides
    has_many :drivers, through: :rides

    def car_list
        cars = self.drivers.map { |driver_inst| driver_inst.car }
        cars.join(":")
    end

    def self.average_rating
        Passenger.average(:rating).to_f.round(2)
      end

      def self.worst_rated
        Passenger.order("rating ASC").first
      end

      def self.best_rated
        Passenger.order("rating DESC").first
      end

      def self.worst_rating_in_existence
        # self.worst_rated.rating.to_f.round(2)
        self.minimum(:rating).to_f.round(2)
      end

      def self.best_rating_in_existence
        # self.best_rated.rating.to_f.round(2)
        self.maximum(:rating).to_f.round(2)
      end
end