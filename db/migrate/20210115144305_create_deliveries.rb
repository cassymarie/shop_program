class CreateDeliveries < ActiveRecord::Migration[6.1]
  def change
    create_table :deliveries do |t|
      t.date :delivery_date
      t.date :scheduled_date
      t.integer :build_id
      t.integer :order_id
      t.integer :truck_id
      t.string :notes

      t.timestamps
    end
  end
end
