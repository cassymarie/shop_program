class Status < ActiveRecord::Base
    has_many :builds
end