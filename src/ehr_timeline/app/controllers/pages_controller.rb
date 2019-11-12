class PagesController < ApplicationController
  def home

  end

  def generate_random_events
    redirect_to root_url
  end
end