Rails.application.routes.draw do
  devise_for :users
  
  devise_scope :user do
  	get 'sign_in', to: 'devise/sessions#new'
    get '/users/sign_out' => 'devise/sessions#destroy', as: 'logout'
    get '/users/sign_up', to: 'users#new', as: 'sign_up'
   # match '/users/:id', :to => 'users#show', :as => :user
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users
  root "users#index" 

  match ':controller(/:action(/:id))', :via => [:get, :post]

end
