Modelle::Application.routes.draw do
  resources :production_items


  resources :production_statuses


  get "customer_stocks/reckoning" => "customer_stocks#reckoning", :as =>"customer_stocks__reckoning_list"
  get "customer_stocks/:id/reckoning" => "customer_stocks#doReckoning", :as =>"customer_stocks_reckoning"
  resources :customer_stocks


  resources :feedstock_stocks


  resources :feedstocks


  resources :product_orders


  resources :orders do
    get :add_products
    resources :production_items
  end


  resources :order_statuses


  resources :customer_prices


  resources :product_stocks

  #Atualiza estoque
  post "product_stocks/:product_order_id/remove_from_stock" => "product_stocks#remove_from_stock", :as => "product_stocks_remove_from_stock"

  get "feedstock_by_products/choose_product" => "feedstock_by_products#choose_product", :as => "feedstock_by_products_choose_product"

  #resources :feedstock_by_products

  get "feedstock_by_products" => "feedstock_by_products#index", :as => "feedstock_by_products"
  get "feedstock_by_products/new" => "feedstock_by_products#new", :as => "new_feedstock_by_products"

  resources :products do
    resources :feedstock_by_products
  end

  resources :customers do
    get :autocomplete_customer_name, :on => :collection
  end

  resources :functions


  devise_for :users

  resources :users


  get "site/index"

  root :to => "site#index"

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

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
