class Vital < ActiveRecord::Base
    belongs_to :patient
    
    def self.valid_params?(params)
        return !params[:blood].empty? && !params[:blood_pressure].empty? && !params[:pulse].empty? && !params[:temperature].empty? && !params[:oxygen_level].empty?
    end

    def formatted_created_at
        self.created_at.strftime("%A, %d %b %Y %l:%M %p")
    end
end
