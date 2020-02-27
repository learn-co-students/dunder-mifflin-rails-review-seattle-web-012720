class Dog < ApplicationRecord
    has_many :employees

    def self.sorted(sort)
        if sort
            self.all.sort_by{|dog| dog.employees.length}
        else   
            Dog.all
        end
    end
end
