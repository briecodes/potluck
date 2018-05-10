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

RSpec.describe Recipe, type: :model do
  it 'has a name field' do
    expect(Recipe.new).to respond_to(:name)
  end

  it 'has a details field' do
    expect(Recipe.new).to respond_to(:details)
  end
end

RSpec.describe User, type: :model do
  before do
    User.destroy_all
    Event.destroy_all
    @user = User.create(name: "Ahamed", username: "ahamed001", password: "hello", password_confirmation: "hello")
    @event = Event.create(title: "Mod 2 potluck", date: "11/12/2019 00:00::00 UTC", timeconvention: "AM", location: "New York", details: "Bring food guys!")
    @event1 = Event.create(title: "Mod 5 potluck", date: "11/12/2019 00:00::00 UTC", timeconvention: "AM", location: "New York", details: "Bring food guys!")

    @user.events << @event
    @user.events << @event1
  end

  it "includes the event in the user events" do
    expect(@user.events.include?(@event)).to be true
  end

  it "count the events" do
    expect(@user.events.count).to eq(2)
  end
end
