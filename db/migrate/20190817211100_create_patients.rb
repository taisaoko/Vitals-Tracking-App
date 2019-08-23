class CreatePatients < ActiveRecord::Migration
  def change
    create_table :patients do |t|
      t.string :name
      t.integer :medical_record_number
      t.date :date_of_birth
      t.integer :nurse_id

      t.timestamps null: false
    end
  end
end
