require 'rails_helper'

RSpec.describe User, type: :model do
    it 'has a password field' do
        expect(User.new).to respond_to(:password)
    end

    it 'has a username field' do
        expect(User.new).to respond_to(:username)
    end

    it 'has a name field' do
        expect(User.new).to respond_to(:name)
    end
end

RSpec.describe Event, type: :model do
    it 'has a title field' do
        expect(Event.new).to respond_to(:title)
    end

    it 'has a location field' do
        expect(Event.new).to respond_to(:location)
    end

    it 'has a details field' do
        expect(Event.new).to respond_to(:details)
    end

    it 'has a date field' do
        expect(Event.new).to respond_to(:date)
    end

    it 'has a timeconvention field' do
        expect(Event.new).to respond_to(:timeconvention)
    end
end