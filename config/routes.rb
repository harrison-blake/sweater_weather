Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :forecast, only: %i[index]
      resources :salaries, only: %i[index] 
    end
  end
end
