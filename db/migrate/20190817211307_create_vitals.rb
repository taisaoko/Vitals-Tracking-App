class CreateVitals < ActiveRecord::Migration
  def change
    create_table :vitals do |t|
      t.text :blood_pressure
      t.integer :pulse
      t.integer :temperature
      t.integer :oxygen_level
      t.integer :height
      t.integer :weight
      t.integer :patient_id

      t.timestamps null: false
    end
  end
end
