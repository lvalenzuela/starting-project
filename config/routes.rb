Cotizar::Application.routes.draw do

  resources :cars
  resources :computers do
    collection do
      post 'index'
      get 'alternative_new' #metodo alternativo de ingreso de computadores
      post 'select_for_compare'
      post 'compare'
      post 'compare_toolbox'
      post 'new_feature'
    end
  end
  match 'computers/:id/edit' => 'computers#edit'

  resources :televisions do
    collection do
      get 'index'
      post 'search'
      post 'select_for_compare'
      post 'compare'
      post 'compare_toolbox'
      post 'new_feature'
    end
  end
  
  resources :main
  resources :smartphones do
    collection do
      get 'index'
      post 'search'
      post 'select_for_compare'
      post 'compare'
      post 'compare_toolbox'
    end
  end

  
  
  
  get "cars/index"
  match 'cars/save' => 'cars#save'
  match 'cars/delete' => 'cars#delete'
  match 'cars/edit' => 'cars#edit'
  match 'cars/new' => 'cars#new'
  match 'cars/update' => 'cars#update'
  match 'cars/search' => 'cars#search'
  get "main/index"

  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
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

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => 'welcome#index'
  
  root :to => 'main#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
