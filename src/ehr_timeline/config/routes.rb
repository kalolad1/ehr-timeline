Rails.application.routes.draw do
  root 'pages#home'

  get 'generate-random-events', to: 'pages#generate_random_events', as: 'generate_random_events'
end
