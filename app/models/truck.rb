class Truck < ActiveRecord::Base
    has_many :deliveries
end