class Patient < ActiveRecord::Base
    has_many :vitals
    belongs_to :nurse
end
