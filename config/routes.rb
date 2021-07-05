Rails.application.routes.draw do


devise_for :users,controllers: {
  sessions: 'users/sessions'
}

devise_for :admins, controllers: {
  sessions: 'admins/sessions'
}

scope module: :public do
  root to: 'products#top'
  get 'about' => 'products#about'
  resources 'products', only: [:index, :show]
  resources 'users', only: [:index, :edit, :show, :update]
  get 'users/out' => 'users#out'
  get 'users/withdraw' => 'users#withdraw'
  delete 'carts_items/destroy_all' => 'cart_items#destroy_all'
  resources 'carts_items', only: [:index, :create, :update, :destroy]
  post 'orders/check' => 'orders#check'
  get 'orders/complete' => 'orders#complete'
  resources :orders, only: [:index, :show, :new, :create]
  resource :favorites, only: [:create, :destroy]
  resource :comments, only: [:create, :destroy]
  resources :rooms, only: [:index, :show]
  resource :chats, :only => [:create]
  resources :payment_cards, only: [:new, :create, :index, :destroy]
 end

 namespace :admin do
  get 'orders' => 'orders#top', as: :root
  resources :orders, only: [:show, :update]
  #resources :users, only: [:index, :show, :edit, :update]
  resources :ordered_products, only: [:update]
  resources :products, except: [:destroy]
  resources :genres, except: [:destroy]
  get 'searches' => "searches"
  resource :charts, only: [:create]
  resources :rooms, only: [:index, :show]
 end

end