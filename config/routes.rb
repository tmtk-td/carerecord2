Rails.application.routes.draw do
  get 'users/index'
  devise_for :users
  get '/staff_infos', to: 'staff_infos#index' 
  get '/care_records', to: 'care_records#index'
  get '/clients', to: 'clients#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :care_records do
    resources :comments
  end
  resources :clients
  resources :staff_infos
  root 'users#index'
  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
end
