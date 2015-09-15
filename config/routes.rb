Rails.application.routes.draw do



  resources :devices

  resources :products

devise_for :users, controllers: { :omniauth_callbacks => "users/omniauth_callbacks",
                                  :devise_session => "users/sessions",
                                  :devise_registration => "users/registrations"}
 

get '/requests/inqueue', to: 'requests#inqueue', as: 'inqueue_requests'
get '/requests/completed', to: 'requests#completed', as: 'completed_requests'

get '/index', to: 'main#index', as: 'main'
post '/getdevice/:id', to: 'devices#get_device', as: 'getdevice'
post '/assigndevice/:id', to: 'devices#assign_device', as: 'assigndevice'
post '/requestdevice/:id', to: 'devices#request_device', as: 'requestdevice'

#get '/users/info', to: 'user_info#overview', as: 'userinfo'
#post '/users/update', to: 'user_info#update', as: 'update_userinfo'
get '/users/getimage', to: 'user_info#send_image', as: 'image'

resource :user_info, path: '/user/info', except: [:index, :destroy]

mount RailsAdmin::Engine => '/admin', as: 'rails_admin'



  #get '/index', to: 'main#index2'

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
   root 'main#index'

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
