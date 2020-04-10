class Patient < ActiveRecord::Base
    belongs_to :nurse
    has_many :vitals
    has_many :patient_vitals
    has_many :vitals, through: :patients_vitals

    # def self.valid_params?(params)
    #    return !params[:name].empty? && !params[:medical_record_number].empty? && !params[:date_of_birth].empty?
    # end
end
