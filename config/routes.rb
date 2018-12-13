Rails.application.routes.draw do

  # namespace :store_admins do
  #   get 'store_admins/index'

  # end
  #devise_for :store_admins

  #devise_scope :store_admins do

    #get 'store_admins', to: 'devise/sessions#new'

 # end
  get 'store_admin/Sindex', as: 'store_admin_path'
  get 'store_admin/new', to: 'store_admin#new'
  get 'store_admin/create', to: 'store_admin#create'
  get 'store_admin/delete' => 'store_admin#delete'
  # get 'store_admin/destroy' => 'store_admin#destroy'
  get 'users/index', as: 'seller_path'

  get 'users/buyer_page', as: 'buyer_path'

  get 'products/index', as: 'product_path'
  get 'products/Sindex', to: 'products#Sindex'

 devise_for :users, controllers: {registrations: 'users/registrations', sessions: 'users/sessions'}, path: '', path_name: {sign_in: 'login', sign_out: 'logout', sign_up: 'register'}
  
  # devise_scope :user do
    
  # end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users
  resources :store_admin
  resources :products
  root "public#home"

  match ':controller(/:action(/:id))', :via => [:get, :post]

end
