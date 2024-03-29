CarTrading::Application.routes.draw do

  resources :running_entries

  resources :soccer_entries

  resources :entries

  resources :partnerships

  root  'static_pages#home'
  match '/signin', to: 'sessions#new',         via: 'get'
  match '/signout', to: 'sessions#destroy',     via: 'delete'
  match '/cars/' => 'cars#index' , via: 'get', :as => :cars_search
  match '/cars/modal' => 'cars#new_modal' , via: 'get', :as => :cars_new_modal
  match '/cars/:id/modal' => 'cars#edit_modal' , via: 'get', :as => :cars_edit_modal
  match '/cars/createmodal' => 'cars#create_modal' , via: 'post', :as => :cars_create_modal
  match '/cars/:id/updatemodal' => 'cars#update_modal' , via: 'post', :as => :cars_update_modal


  match "/cars/:car_id/bids/" => "bids#modal" , via: 'get', :as => :bids_modal
  match "/cars/:car_id/bids/" => "bids#create_modal" , via: 'post', :as => :bids_create_modal

  resources :users

  resources :bids do
    resources :users
  end

  resources :cars do
    resources :bids
  end

  resources :sports
  resources :participants
  resources :subscriptions

  resources :participants do
    resources :partnerships
  end

  resources :participants do
    resources :subscriptions
  end

  resources :partnerships do
    resources :subscriptions
  end

  resources :subscriptions do
    resources :entries
  end

  resources :sessions, only: [:new, :create, :destroy]

  # The priority is based upon order of creation: first created -> highest priority.
  # See how al your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'
  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end
  
  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
