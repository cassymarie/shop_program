class Job < ActiveRecord::Base
    has_many :orders
    has_many :builds
    has_many :used_materials
    has_many :materials, through: :used_materials
    
end