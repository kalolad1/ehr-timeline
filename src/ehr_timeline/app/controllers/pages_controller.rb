class PagesController < ApplicationController
  def home
    if @events.blank?
      @events = Event.get_default_events
    end
  end

  def generate_random_events
    @events = Event.generate_random_events
    redirect_to root_url
  end
end