class CreatePatientVitals < ActiveRecord::Migration
  def change
    create_table :patient_vitals do |t|
      t.integer :patient_id
      t.integer :vital_id
    end
  end
end