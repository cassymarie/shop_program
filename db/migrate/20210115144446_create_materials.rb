class CreateMaterials < ActiveRecord::Migration[6.1]
  def change
    create_table :materials do |t|
      t.string :code
      t.string :description
      t.string :um

      t.timestamps
    end
  end
end
