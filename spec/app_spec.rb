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
    Recipe.destroy_all

    @user = User.create(name: "Ahamed", username: "ahamed001", password: "hello", password_confirmation: "hello")
    @event1 = Event.create(title: "Mod 2 potluck", date: "11/12/2019 00:00::00 UTC", timeconvention: "AM", location: "New York", details: "Bring food guys!")
    @event2 = Event.create(title: "Mod 5 potluck", date: "11/12/2019 00:00::00 UTC", timeconvention: "AM", location: "New York", details: "Bring food guys!")
    @recipe1 = Recipe.create(name: "Biriyani", details: "Very good!", user_id: @user.id)
    @recipe2 = Recipe.create(name: "Coconut Rice", details: "Very good!", user_id: @user.id)

    @user.events << @event1
    @user.events << @event2
  end

  it "includes the event in the user events" do
    expect(@user.events.include?(@event1)).to be true
  end

  it "count the events" do
    expect(@user.events.count).to eq(2)
  end

  it "gets the user's recipes" do
    expect(@user.recipes).to include(@recipe1, @recipe2)
  end
end

RSpec.describe Event, type: :model do
  before do
    @valid_event = Event.create(title: "Mod 5 potluck", date: "11/12/2019 00:00::00 UTC", timeconvention: "AM", location: "New York", details: "Bring food guys!")
    @invalid_event_missing_title = Event.create(date: "11/12/2019 00:00::00 UTC", timeconvention: "AM", location: "New York", details: "Bring food guys!")
    @invalid_event_longer_title = @event = Event.create(title: "Mod 5 potluck. Moddy! moddy! moddy!", date: "11/12/2019 00:00::00 UTC", timeconvention: "AM", location: "New York", details: "Bring food guys!")
  end

  it "is valid" do
    expect(@valid_event).to be_valid
  end

  it "is invalid with no title" do
    expect(@invalid_event_missing_title).to be_invalid
  end

  it "is invalid with a longer title" do
    expect(@invalid_event_longer_title).to be_invalid
  end

  it "is invalid when non-unique" do
    @event = Event.create(title: "Mod 5 potluck", date: "11/12/2019 00:00::00 UTC", timeconvention: "AM", location: "New York", details: "Bring food guys!")
    expect(@event).to be_invalid
  end
end
