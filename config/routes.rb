Rails.application.routes.draw do

 default_url_options :host => "verticalspanish.com"

  devise_for :users
  
  resources :subscription
  
  resources :songs
  resources :books
  resources :movies
  #:controllers => { :registrations => "registrations" }
  resources :contacts
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  
  
  get '/', to: 'pages#home'
  get '/method', to: 'pages#method'
  get '/learn-spanish-medellin', to: 'pages#medellin'
  get '/pricing', to:  'pages#pricing'
  get '/contact', to:   'pages#contact'
  get '/jobs', to:  'pages#jobs'
  get '/faq', to: 'pages#faq'
  get '/enterprise', to: 'pages#enterprise'
  get 'spanish-teacher/jorge-carrasco', to: 'pages#jorge_carrasco'
  get 'spanish-teacher/mya-alverez', to: 'pages#teacher_mya_alverez'
  get 'spanish-teacher/maria-jose-montiel', to: 'pages#teacher_maria_jose_montiel'
  get '/test', to:   'pages#test'
  get '/test-2', to:   'pages#test_2'
  
  get '/student', to:   'dashboard_pages#student'
  get '/teacher', to:   'dashboard_pages#teacher'
  get '/admin', to:   'dashboard_pages#admin'
  get '/student/resources/movies', to:   'dashboard_pages#resource_tv'
  get '/cards', to: 'dashboard_pages#cards'
  post '/cards', to: 'dashboard_pages#update_card'
  get '/student-books', to:   'dashboard_pages#resource_books'
  get '/student-music', to:   'dashboard_pages#resource_music'
  get '/student-movies', to:   'dashboard_pages#resource_movies'
  get '/student-apps', to:   'dashboard_pages#resource_apps'
  get '/quizes', to:   'dashboard_pages#quizes'
  get '/tests', to:   'dashboard_pages#tests'
  get '/billing', to:   'dashboard_pages#billing'
  get '/teacher-bookings', to:   'dashboard_pages#teacher_bookings'

  
  
  get '/reset-password', to:   'dashboard_pages#reset_password'
  
  get '/book-a-lesson', to:   'dashboard_pages#book_a_lesson'
  


  
  get '/404', to:   'errors#not_found'
  get '/422', to:   'errors#unacceptable'
  get '/500', to:   'errors#internal_error'
  
  resources :plans do
    resources :subscriptions
  end
  


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
