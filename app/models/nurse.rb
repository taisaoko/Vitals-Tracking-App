class Nurse < ActiveRecord::Base
    has_many :patients
    has_many :patient_vitals, through: :patients

    has_secure_password # gives us access to the #authenticate method!

    def slug
        name.downcase.gsub(" ","-")
    end
    
    def self.find_by_slug(slug)
        Nurse.all.find{|nurse| nurse.slug == slug}
    end
   
end
