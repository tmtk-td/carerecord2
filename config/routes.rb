Rails.application.routes.draw do
  get '/care_records', to: 'care_records#index'
  get '/clients', to: 'clients#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :care_records
  resources :clients 
end
