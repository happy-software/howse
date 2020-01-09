Rails.application.routes.draw do
  resources :houses
  resources :home_valuations

  namespace :api do
    namespace :v1 do
      post 'zillow_search', action: 'lookup_address', controller: 'zillow_search'
      post 'track_zpid',    action: 'track_property', controller: 'zillow_search'
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
