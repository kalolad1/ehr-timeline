class PagesController < ApplicationController
  def home
    @events = Event.generate_random_events(true)
    @events.each do |event|
      puts event.event_type
    end
  end

  def generate_random_events
    @events = Event.generate_random_events(false)
    redirect_to root_url
  end
end