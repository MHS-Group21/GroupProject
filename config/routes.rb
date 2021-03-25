Rails.application.routes.draw do

  resources :channels
  root 'discussions#index'
  
  # Nested replies inside discussions 
  resources :discussions do
    resources :replies
  end
  devise_for :users, controllers: { registrations: 'registrations'}

  # route for volunteers home page
  get "volunteer", to: "home#volunteer", as: :volunteer

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
