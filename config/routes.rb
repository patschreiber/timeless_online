Wizardtower::Application.routes.draw do
  devise_for :users, :controllers => { :registrations => "registrations" }

  devise_scope :user do
    match '/signup' => 'registrations#new', via: [:get, :post], :as => :signup
    get '/signin' => 'devise/sessions#new'
    match '/signout' => 'devise/sessions#destroy', via: 'delete'
    match '/profile' => 'devise/registrations#edit', via: [:get, :post], :as => :profile
  end

  authenticated :user do 
    resources :battle
  end
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'landing_page#index'
  get '/about' => 'pages#index', :as => :about
  match '/game' => 'game#index', via: [:get, :post], :as => :game
  get '/help' => 'pages#help', :as => :help
  match '/inventory' => 'inventory#show', via: [:get, :post], :as => :inventory
  get '/faq' => 'pages#faq', :as => :faq

  # Ajax requests
  post '/battle-action' => 'battle#battle_action'
  post '/post-battle-update' => 'battle#post_battle_update'
  post '/enemy-action' => 'battle#enemy_action'
  post '/equip' => 'inventory#equip_or_unequip_item'

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
