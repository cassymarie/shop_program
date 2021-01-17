class Used_Material < ActiveRecord::Base
    belongs_to :material
    belongs_to :job
end