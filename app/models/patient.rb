class Patient < ActiveRecord::Base
    belongs_to :nurse
    has_many :vitals
    has_many :patient_vitals
    has_many :vitals, through: :patient_vitals

    def slug
        name.downcase.gsub(" ","-")
    end
    
    def self.find_by_slug(slug)
        all.find{|patient| patient.slug == slug}
    end

    # def self.valid_params?(params)
    #    return !params[:name].empty? && !params[:medical_record_number].empty? && !params[:date_of_birth].empty?
    # end
end
