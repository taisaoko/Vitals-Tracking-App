class CreateVitals < ActiveRecord::Migration
  def change
    create_table :vitals do |t|
      t.string :blood_pressure
      t.integer :pulse
      t.float :temperature
      t.integer :oxygen_level
      
      t.timestamps null: false
    end
  end
end
