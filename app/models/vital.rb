class Vital < ActiveRecord::Base
    belongs_to :patient
    
    def self.valid_params?(params)
        return !params[:blood].empty? && !params[:blood_pressure].empty? && !params[:pulse].empty? && !params[:temperature].empty? && !params[:oxygen_level].empty?
    end
end
