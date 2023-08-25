require 'rails_helper'

RSpec.describe Animal, type: :model do
  it 'is valid with valid attributes' do
    animal_1 = Animal.create(name: 'Dog', binomial: "Cannis familiaris")
    expect(animal_1).to be_valid
  end

  it 'is not valid without a common name' do
    animal_1 = Animal.create(binomial: "Cannis familiaris")
    expect(animal_1.errors[:name]).to_not be_empty
  end

  it 'is not valid without a scientific binomial' do
    animal_1 = Animal.create(name: 'Dog')
    expect(animal_1.errors[:binomial]).to_not be_empty
  end

  it 'is not valid if common name is same as scientific binomial' do
    animal_1 = Animal.create(name: "Cannis familiaris", binomial: "Cannis familiaris")
    expect(animal_1.errors[:name]).to_not be_empty
  end

  it 'does not allow duplicate name' do
    animal_2 = Animal.create(name: 'Rabbit', binomial: 'Leporidae cuniculas')
    animal_3 = Animal.create(name: 'Rabbit', binomial: 'Proboscidea elephantidae')
    expect(animal_3.errors[:name]).to_not be_empty
  end

  it 'does not allow duplicate binomial' do
    animal_2 = Animal.create(name: 'Rabbit', binomial: 'Leporidae cuniculas')
    animal_3 = Animal.create(name: 'Elephant', binomial: 'Leporidae cuniculas')
    expect(animal_3.errors[:binomial]).to_not be_empty
  end
end
