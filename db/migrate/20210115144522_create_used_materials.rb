class CreateUsedMaterials < ActiveRecord::Migration[6.1]
  def change
    create_table :used_materials do |t|
      t.integer :job_id
      t.string :subjob_code
      t.integer :material_id
      t.decimal :quantity

      t.timestamps
    end
  end
end
