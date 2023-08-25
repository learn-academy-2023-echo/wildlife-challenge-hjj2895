require 'rails_helper'

RSpec.describe Sighting, type: :model do
  it 'is valid with valid attributes' do
    animal_1 = Animal.create(name: 'Dog', binomial: "Cannis familiaris")
    sighting_1 = Animal.first
    sighting_1.sightings.create(latitude: 40.234, longitude: -53.2375, date: "2023-08-01")
    expect(sighting_1).to be_valid
  end

  it 'is not valid without a latitude' do
    # animal_1 = Animal.create(name: 'Dog', binomial: "Cannis familiaris")
    # sighting_1 = animal_1.sightings
    # p sighting_1
    sighting_1 = Sighting.create(animal_id: 1, longitude: -53.2375, date: "2023-08-01")
    expect(sighting_1.errors[:latitude]).to_not be_empty
  end

  it 'is not valid without a longitude' do
    sighting_1 = Sighting.create(animal_id: 1, latitude: 40.234, date: "2023-08-01")
    expect(sighting_1.errors[:longitude]).to_not be_empty
  end

  it 'is not valid without a date' do
    sighting_1 = Sighting.create(animal_id: 1, latitude: 40.234, longitude: -53.2375)
    expect(sighting_1.errors[:date]).to_not be_empty
  end
end
