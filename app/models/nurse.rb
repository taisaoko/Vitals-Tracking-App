class Nurse < ActiveRecord::Base
    has_many :patients

    has_secure_password

    def slug
        name.downcase.gsub(" ","-")
    end
    
    def self.find_by_slug(slug)
        Nurse.all.find{|nurse| nurse.slug == slug}
    end

end
