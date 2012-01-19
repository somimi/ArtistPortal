ArtistPortal::Application.routes.draw do
  resources :literary_submissions

  #get "asset/images"
  
 match 'images/:id/images' => 'images#images'
 match 'store_submissions/:id/duplicate' => 'store_submissions#duplicate', :as => :duplicate_store_submission
  
  resources :store_submissions
  resources :store_submissions do
    member do
      get :images
    end
  end
  resources :payment_notifications
  
  get "users/index"
  get "users/edit"
  get "users/update"
  get "users/show"
  get "users/destroy"

  get "pages/home"
  get "pages/contact"
  get "pages/faq"
  get "pages/visual_art"
  get "pages/film_video"
  get "pages/literary"
  get "pages/store"
  get "pages/installation"
  get "pages/performance"

  # devise_for :users
  devise_for :users, :path_prefeix => 'd' do get '/users/sign_out' => 'devise/sessions#destroy' end
  resources :users

  resources :artists
  
  resources :visual_submissions
  resources :visual_submissions do
      member do
       get :images
     end
  end
  
  
  
  
  root :to => "pages#home"

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
  # match ':controller(/:action(/:id(.:format)))'
end
