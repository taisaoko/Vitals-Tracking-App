class Vital < ActiveRecord::Base
    has_many :patient_vitals
    has_many :patients, through: :patient_vitals
    has_many :nurses, through: :patients

    # def self.valid_params?(params)
    #     return !params[:blood].empty? && !params[:blood_pressure].empty? && !params[:pulse].empty? && !params[:temperature].empty? && !params[:oxygen_level].empty?
    # end

    def formatted_created_at
        self.created_at.strftime("%A, %d %b %Y %l:%M %p")
    end
end
