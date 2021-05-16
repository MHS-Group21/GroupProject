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
  get "home", to: "home#index", as: :home_index
  get "admin", to: "home#admin", as: :admin
  get "volunteer_list", to: "home#volunteer_list", as: :volunteer_list
  get "contact", to: "home#contact"

  #post request for contact form
  post 'request_contact', to: 'home#request_contact'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
