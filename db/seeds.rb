# here is where I create some seed date to work with and test assocs.

# Create 2 nurses

jessi = Nurse.create(name: "Jessi", badge_number: 123, password: "password")
vic = Nurse.create(name: "Vic", badge_number: 456, password: "password")

# Create some patients
kay = Patient.create(name: "Kay", medical_record_number: 111, date_of_birth: 1935-01-01, nurse_id: jessi.id)

# Use AR to pre-associate data:
calvin = jessi.patients.create(name: "Calvin", medical_record_number: 222, date_of_birth: 1990-01-01)
mark = jessi.patients.create(name: "Mark", medical_record_number: 333, date_of_birth: 1957-01-01)
emma = vic.patients.create(name: "Emma", medical_record_number: 444, date_of_birth: 1990-01-01)

# Create some vitals
Vital.create(blood_pressure: "150/90", pulse: 80, temperature: 97.7 , oxygen_level: 99, patient_id: kay.id)

# Use AR to pre-associate data:
calvin.vitals.create(blood_pressure: "140/90", pulse: 82, temperature: 98.0 , oxygen_level: 99, patient_id: calvin.id)
mark.vitals.create(blood_pressure: "150/90", pulse: 80, temperature: 98.5 , oxygen_level: 99, patient_id: mark.id)
emma.vitals.create(blood_pressure: "120/90", pulse: 80, temperature: 97.7 , oxygen_level: 99, patient_id: emma.id)
