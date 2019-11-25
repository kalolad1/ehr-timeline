class PagesController < ApplicationController
  def home
    # Generate randoms events and sorts them in correct order.
    @events = Event.order_by_occurrence(Event.generate_random_events)
    session[:events_ids] = []
    @events.each do |event|
      session[:events_ids].push(event.id)
    end

    # Initialize the filter values.
    init_and_store_filter_values
  end

  def init_and_store_filter_values
    # Initializes all the filters to be on in the beginning.
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
    # Filters events depending on the check boxes toggled.
    events_ids = session[:events_ids]
    @events = []
    update_filter_values(params)

    # Checks if an event should be included in the timeline.
    events_ids.each do |event_id|
      event = Event.find(event_id)
      if params.key?(event.event_type) && params.key?(event.get_priority.to_s)
        @events.push(event)
      end
    end

    # Checks if an event should not be included in the timeline. If this is the
    # case, the event is pushed to the bottom of the list and it will be
    # rendered with striken-through text.
    events_ids.each do |event_id|
      event = Event.find(event_id)
      if !params.key?(event.event_type) || !params.key?(event.get_priority.to_s)
        event.is_included = false
        @events.push(event)
      end
    end

    # Save the filter values.
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
    # Updates filter values depending on the parameters that were passed in
    # from the view.
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