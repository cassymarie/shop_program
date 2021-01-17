class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.date :date_received
      t.string :description
      t.string :po_number
      t.string :ticket_number
      t.string :vendor
      t.string :pc_ct
      t.string :notes
      t.integer :location_id
      t.integer :job_id
      t.string :subjob_code

      t.timestamps
    end
  end
end
