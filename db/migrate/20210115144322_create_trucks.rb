class CreateTrucks < ActiveRecord::Migration[6.1]
  def change
    create_table :trucks do |t|
      t.string :description
      t.string :make
      t.string :model
      t.boolean :accepts_cage
      t.timestamps
    end
  end
end
