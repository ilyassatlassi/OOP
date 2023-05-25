require_relative 'spec_helper'

describe Person do
  before :each do
    @person = Person.new(20, name: 'taflon')
  end

  it 'should have an instance of Person' do
    expect(@person).to be_instance_of Person
  end

  it 'should have an empty rentals array' do
    rentals = @person.rentals
    expect(rentals).to eq []
  end

  it 'should have the name "taflon"' do
    name = @person.name
    expect(name).to eq 'taflon'
  end

  it 'should have an age of 20' do
    age = @person.age
    expect(age).to eq 20
  end

  it 'should be able to use services' do
    services = @person.can_use_services?
    expect(services).to be_truthy
  end

  it 'should add a rental to rentals array' do
    book = double('Book')
    date = '2023-05-25'
    rental = instance_double('Rental')
    allow(Rental).to receive(:new).with(date, book, @person).and_return(rental)

    @person.add_rental(book, date)

    expect(@person.rentals).to include(rental)
  end
end
