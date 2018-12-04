Rails.application.routes.draw do
  get 'sellings/index'
  get 'sellings/trade'
  get 'sellings/delete'
  get 'sellings/destroy'
  #devise_for :store_admins

  #devise_scope :store_admins do

    #get 'store_admins', to: 'devise/sessions#new'

 # end

 devise_for :users, controllers: {
        registrations: 'users/registrations',
        sessions: 'users/sessions'
      }
  
  devise_scope :user do
    
  	get 'shop_app', to: 'devise/sessions#new'
    get '/users/sign_out' => 'devise/sessions#destroy', as: 'logout'
    #get '/users/sign_up', to: 'users#new', as: 'sign_up'
   # match '/users/:id', :to => 'users#show', :as => :user
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users
  resources :products
  root "products#index" 

  match ':controller(/:action(/:id))', :via => [:get, :post]

end
