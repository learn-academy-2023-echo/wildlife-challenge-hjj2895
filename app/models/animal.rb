class Animal < ApplicationRecord
    has_many :sightings
    validates :name, :binomial, presence: true
    validates :name, uniqueness: true
    validates :binomial, uniqueness: true
    validate :name_not_matching_binomial

    def name_not_matching_binomial
        if self.name == self.binomial
            errors.add :name, "Name cannot match binomial"
        end
    end
end
