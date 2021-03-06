Rails.application.routes.draw do
  devise_for :users
  
  root 'pages#home'
  get 'home', to: 'pages#home'
  get 'index', to: 'pages#home'
  post 'video', to: 'pages#change_video'
  get '/.well-known/acme-challenge/:id', to: 'pages#letsencrypt'

  get 'beliefs', to: 'pages#beliefs'

  get 'history', to: 'pages#history'

  get 'contact', to: 'pages#contact'
  post 'send_contact_mail', to: 'mail#send_contact_mail'

  get 'admin', to: 'admin#index'

  resources :newsletters, only: [:index, :create, :destroy, :update]
  get 'newsletters/edit', to: 'newsletters#edit'
  get 'newsletter', to: 'newsletters#index'

  get 'sermons/edit', to: 'sermons#edit'
  # get 'sermons/:id', to: 'sermons#show'
  resources :sermons, only: [:index, :show, :create, :destroy, :update]

  get 'articles/edit', to: 'articles#edit'
  resources :articles, only: [:index, :create, :destroy, :update]

  get 'events/edit', to: 'events#edit'
  get 'events/:year/:month', to: 'events#index'
  resources :events, only: [:index, :create, :destroy, :update]


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
