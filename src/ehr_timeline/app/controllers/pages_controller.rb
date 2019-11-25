class PagesController < ApplicationController
  def home
    if @events.blank?
      @events = Event.order_by_occurrence(Event.generate_random_events)
    end
  end

  def generate_random_events
    redirect_to root_url
  end

  def filter_events
    puts "-------"
    puts "\n\n\n\n\n"
    puts @events
    puts "\n\n\n\n\n"
    puts "-------"
    render 'home.html.erb'
  end
end