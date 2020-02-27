class Employee < ApplicationRecord
    belongs_to :dog
    validates :title, uniqueness: true 
    validates :alias, uniqueness: true 
    def to_s 
        self.first_name + " " + self.last_name
    end
end
