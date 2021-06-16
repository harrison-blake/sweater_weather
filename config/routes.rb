Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :forecast, only: %i[index]
      resources :backgrounds, only: %i[index]
      resources :users, only: %i[create]
      resources :sessions, only: %i[create]
      resources :road_trip, only: %i[create]

    end
  end
end
