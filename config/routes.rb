Blog::Application.routes.draw do

  devise_for :users, :skip => [:session]
  as :user do
    get '/lonin' => 'devise/sessions#new', :as => :new_user_session
    post '/signin' => 'devise/sessions#create', :as => :user_session
    delete '/signout' => 'devise/sessions#destroy', :as => :destroy_user_session
  end

  #Categories
  #get '/Configuring linux servers' => 'articles#linux'
  #get '/Movie' => 'articles#movie'
  #get '/Music' => 'articles#music'
  #get '/Ruby Programming' => 'articles#ruby_programming'
  #get '/Travel' => 'articles#travel'
  #get '/Watching Ballgame' => 'articles#ballgame'
  #resources :categories do
     #get '/categories/:name/:id' => 'categories#show',as: :what
  #end
  resources :categories


  root :to => "articles#index"
  resources :articles do
     #pretty url for kaminari pagination
     get 'page/:page', :action => :index, :on => :collection
     resources :comments
     #resources :categories

  end


  #resources :users
  #resource :session, :only => [:new, :create, :destroy]
  #no devise
  #get '/login' => "sessions#new", :as => "login"

  #no devise
  #get '/logout' => "sessions#destroy", :as => "logout"


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
