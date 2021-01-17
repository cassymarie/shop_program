class CreateJobs < ActiveRecord::Migration[6.1]
  def change
    create_table :jobs do |t|
      t.string :job_number
      t.string :name
      t.string :manager
      t.string :foreman

      t.timestamps
    end
  end
end
