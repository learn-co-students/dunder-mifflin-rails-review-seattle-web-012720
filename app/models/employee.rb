class Employee < ApplicationRecord
    belongs_to :dog
    validates :title, uniqueness: true
    validates :alias, uniqueness: true

    def self.search(search)
        if search
          dog = Dog.find_by(name: search)
          if dog
            self.where(dog_id: dog)
          else Employee.all
          end
        else
          Employee.all
        end
    end
end
