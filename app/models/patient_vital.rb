class PatientVital < ActiveRecord::Base
    belongs_to :patient
    belongs_to :vital
end