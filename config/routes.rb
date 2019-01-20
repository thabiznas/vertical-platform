Rails.application.routes.draw do
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'
  
  get '/', to: 'pages#home'
  get '/method', to: 'pages#method'
  get '/spanish-school-medellin', to: 'pages#teachers'
  get '/pricing', to:  'pages#pricing'
  get '/contact', to:   'pages#contact'
  get '/join', to:  'pages#join'
  get '/join', to: 'pages#help'
  get '/enterprise', to: 'pages#enterprise'
  get '/teacher-jorge-carrasco', to: 'pages#teacher_jorge_carrasco'
  get '/teacher-mya-alverez', to: 'pages#teacher_mya_alverez'
  get '/teacher-maria-jose-montiel', to: 'pages#teacher_maria_jose_montiel'
  get '/test', to:   'pages#test'
  get '/test-2', to:   'pages#test_2'



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
