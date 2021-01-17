class Build < ActiveRecord::Base
    belongs_to :job
    belongs_to :location
    belongs_to :status
    include ShopTracking
    extend ShopTracking::ClassMethods
    include ShopTracking::InstanceMethods
end
