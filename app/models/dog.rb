class Dog < ApplicationRecord

    has_many :employees
    validates :alias, uniqueness: true
    validates :title, uniqueness: true
end
