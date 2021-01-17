class Order < ActiveRecord::Base
    belongs_to :job
    belongs_to :location

    include ShopTracking
    extend ShopTracking::ClassMethods
    include ShopTracking::InstanceMethods
end