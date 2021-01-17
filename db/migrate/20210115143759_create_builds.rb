class CreateBuilds < ActiveRecord::Migration[6.1]
  def change
    create_table :builds do |t|
      t.date :date_received
      t.integer :job_id
      t.string :subjob_code
      t.string :description
      t.integer :location_id
      t.integer :status_id
      t.string :pc_ct
      t.string :notes
      t.string :to_number
      t.decimal :weight
      t.string :liner
      t.integer :sq_ft
      t.string :dept
      t.string :completion

      t.timestamps
    end
  end
end
