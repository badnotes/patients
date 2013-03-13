class CreatePatients < ActiveRecord::Migration
  def change
    create_table :patients do |t|
      t.string :first_name
      t.string :middle_name
      t.string :last_name
      t.date :birth
      t.string :gender
      t.string :status
      t.integer :viewed_count
      t.integer :location_id
      t.boolean :is_deleted

      t.timestamps
    end
    add_index :patients, [:location_id, :created_at]
  end
end
