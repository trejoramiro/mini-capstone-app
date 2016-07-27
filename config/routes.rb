Rails.application.routes.draw do

  get '/' => 'books#index'

  get 'books' => 'books#index'

  get 'books/new' => 'books#new'

  post 'books' => 'books#create'

  get 'books/:id' => 'books#show'

  get 'books/:id/edit' => 'books#edit'

  patch 'books/:id' => 'books#update'

  delete 'books/:id' => 'books#destroy'

  #####################################

"/books/8/images/12"

  get 'books/:book_id/images/new' => 'images#new'

  post 'books/:book_id/images' => 'images#create'

  get 'books/:book_id/images/edit' => 'images#edit'

  patch 'books/:book_id/images' => 'images#update'

  delete 'books/:book_id/images/:id' => 'images#destroy'


  ##########################################

  get 'suppliers' => 'suppliers#index'

  get 'suppliers/new' => 'suppliers#new'

  post 'suppliers' => 'suppliers#create'

  get 'suppliers/:id' => 'suppliers#show'

  get 'suppliers/:id/edit' => 'suppliers#edit'

  patch 'suppliers/:id' =>'suppliers#update'

  delete 'suppliers/:id' => 'suppliers#destroy'

  ############################################

  get '/signup' => 'users#new'

  post '/users' => 'users#create'


  ###########################################

  #this route takes you to just the form
  get '/login' => 'sessions#new'

  post '/login' => 'sessions#create'

  get '/logout' => 'sessions#destroy'

  ##########################################
  #get 'orders/new' => 'suppliers#new'

  #post "orders" => 'orders#create'

  post 'orders' => 'orders#create'

  get 'orders/:id' => 'orders#show'



  ##########################################

  get 'cart' => 'carted_products#index'

  post 'cart/:product_id' => 'carted_products#create'

  delete 'cart/:id' => 'carted_products#destroy'





  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

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
