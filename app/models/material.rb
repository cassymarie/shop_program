class Material < ActiveRecord::Base
    has_many :used_materials
    has_many :jobs, through: :used_materials
end