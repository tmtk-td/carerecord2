Rails.application.routes.draw do
  get '/staff_infos', to: 'staff_infos#index' 
  get '/care_records', to: 'care_records#index'
  get '/clients', to: 'clients#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :care_records
  resources :clients 
  resources :staff_infos
end
