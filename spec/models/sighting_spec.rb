require 'rails_helper'

RSpec.describe Sighting, type: :model do
  it 'is valid with valid attributes' do
    sighting_1 = Animal.first
    sighting_1.create(latitude: 40.234, longitutde: -53.2375, date: "2023-08-01")
    expect(sighting_1).to be_valid
  end

  # it 'is not valid without a latitude' do
  #   sighting_1 = Sighting.create(longitutde: -53.2375, date: "2023-08-01")
  #   expect(sighting_1.errors[:latitude]).to_not be_empty
  # end

  # it 'is not valid without a scientific binomial' do
  #   animal_1 = Animal.create(name: 'Dog')
  #   expect(animal_1.errors[:binomial]).to_not be_empty
  # end
end
