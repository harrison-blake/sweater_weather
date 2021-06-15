Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :forecast, only: %i[index]
      resources :backgrounds, only: %i[index]
    end
  end
end
