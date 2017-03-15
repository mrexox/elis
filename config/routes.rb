Rails.application.routes.draw do

  root 'main_page#home'

  get 'admin', :to => 'access#console'
  get 'access/console'
  get 'access/login'
  post 'access/attempt_login'
  get 'access/logout'
  get 'blog/:permalink', :to => 'main_page#show_post', :as => 'show_post'

  get 'blog', to: 'main_page#blog'
  get 'shop', to: 'main_page#shop'
  get 'contacts', to: 'main_page#contact_me'
	get 'search', to: 'main_page#search'
	get 'about', to: 'main_page#about'
	get 'portfolio', to: 'main_page#portfolio'		
  resources :messages, only: [:index, :create, :new, :destroy, :show]
	resources :tags, only: [:index, :create, :destroy]

  resources :posts do
    # add delete here
    member do
      get :delete
    end
  end

  resources :slider_items do |s|
    member do
      get :delete
    end
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
