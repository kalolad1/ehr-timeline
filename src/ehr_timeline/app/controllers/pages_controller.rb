class PagesController < ApplicationController
  def home
    @events = Event.order_by_occurrence(Event.generate_random_events)
    session[:events_ids] = []
    @events.each do |event|
      session[:events_ids].push(event.id)
    end

    init_and_store_filter_values
  end

  def init_and_store_filter_values
    @event_type_filter_values = []
    Event.event_types.each do ||
      @event_type_filter_values.push(true)
    end

    @priority_filter_values = []
    (Event::MIN_PRIORITY..Event::MAX_PRIORITY).each do ||
      @priority_filter_values.push(true)
    end

    session[:event_type_filter_values] = @event_type_filter_values
    session[:priority_filter_values] = @priority_filter_values
  end

  def generate_random_events
    redirect_to root_url
  end

  def filter_events
    events_ids = session[:events_ids]
    @events = []

    update_filter_values(params)
    # puts "----\n\n\n\n\n"
    # puts params
    # puts "----\n\n\n\n\n"

    events_ids.each_with_index do |event_id, index|
      event = Event.find(event_id)
      if params.key?(event.event_type) && params.key?(event.get_priority.to_s)
        @events.push(event)
      end
    end

    events_ids.each do |event_id|
      event = Event.find(event_id)
      if !params.key?(event.event_type) || !params.key?(event.get_priority.to_s)
        event.is_included = false
        @events.push(event)
      end
    end

    Event.event_types.each_with_index do |event_type, index|
      unless params.has_key?(event_type[0])
        session[:event_type_filter_values][index] = false
      end
    end

    (Event::MIN_PRIORITY..Event::MAX_PRIORITY).each_with_index do |i, index|
      unless params.has_key?(i.to_s)
        session[:priority_filter_values][index] = false
      end
    end

    @event_type_filter_values = session[:event_type_filter_values]
    @priority_filter_values = session[:priority_filter_values]

    render 'home.html.erb'
  end

  def update_filter_values(params)
    Event.event_types.each_with_index do |event_type, index|
      if params.has_key?(event_type[0])
        session[:event_type_filter_values][index] = true
      end
    end

    (Event::MIN_PRIORITY..Event::MAX_PRIORITY).each_with_index do |i, index|
      if params.has_key?(i.to_s)
        session[:priority_filter_values][index] = true
      end
    end
  end
end