class Event < ApplicationRecord
  has_many :user_events
  has_many :users, through: :user_events
  has_many :event_recipes
  has_many :recipes, through: :event_recipes

  validates(:title, {presence: true, uniqueness: true, length: {maximum: 20}})
  validates(:location, {presence: true, length: {maximum: 100}})
  validates(:date, {presence: true})
  #validates(:timeconvention, {presence: true})
  validates(:details, {length: { maximum: 1000 }})

  # Total # of events
  def self.total_events
    Event.all.length
  end
  # List of events
  def self.events_list
    Event.all.map do |event_obj|
      event_obj.title
    end
  end
  # Most popular event - the event which has most people
  def self.popular_event
    hash_count = {}

    Event.all.select do |event_obj|
      hash_count[event_obj.title] = event_obj.users.length
    end

    hash_count.key(hash_count.values.max)
  end
  # Most popular location
  def self.popular_location
    hash_count = Hash.new(0)

    Event.all.map do |event_obj|
      event_obj.location
    end.each do |location|
      hash_count[location] += 1
    end

    hash_count.key(hash_count.values.max)
  end
  # Most popular time of day / time of year
  def self.popular_month

  end
end
