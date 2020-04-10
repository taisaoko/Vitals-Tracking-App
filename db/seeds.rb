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
vital_1 = Vital.create(blood_pressure: "150/90", pulse: 80, temperature: 97.7 , oxygen_level: 99)
vital_2 = Vital.create(blood_pressure: "120/90", pulse: 85, temperature: 98.5 , oxygen_level: 100)
vital_3 = Vital.create(blood_pressure: "110/80", pulse: 82, temperature: 97.9 , oxygen_level: 99)

# Create some patient_vitals:
patient_vital_1 = PatientVital.create(patient_id:1, vital_id: 1)
patient_vital_2 = PatientVital.create(patient_id:1, vital_id: 2)
patient_vital_3 = PatientVital.create(patient_id:3, vital_id: 3)