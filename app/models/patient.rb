class Patient < ActiveRecord::Base
    has_many :vitals
    belongs_to :nurse

    def self.valid_params?(params)
       return !params[:name].empty? && !params[:medical_record_number].empty? && !params[:date_of_birth].empty?
    end
end
