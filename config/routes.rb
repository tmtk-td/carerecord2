Rails.application.routes.draw do
  get '/blogs', to: 'care_records#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :care_records do
    collection do
      post :confirm
    end
  end
end
