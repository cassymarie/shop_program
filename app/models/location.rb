class Location < ActiveRecord::Base
    has_many :builds
    has_many :orders
end