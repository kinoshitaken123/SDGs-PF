Rails.application.routes.draw do

devise_for :users,controllers: {
  sessions: 'users/sessions'
}

scope module: :public do
  root to: 'products#top'
  get 'about' => 'products#about'
  resources 'products', only: [:index, :show]
  resources 'users', only: [:index, :edit]
  get 'users/out' => 'users#out'
  get 'users/withdraw' => 'users#withdraw'
  delete 'carts_items/destroy_all' => 'cart_items#destroy_all'
  resources 'carts_items', only: [:index, :create, :update, :destroy]
  post 'orders/check' => 'orders#check'
  get 'orders/complete' => 'orders#complete'
  resources :orders, only: [:index, :show, :new, :create]
 end

 namespace :admin do
  get 'orders' => 'orders#top', as: :root
  resources :orders, only: [:show, :update]
  resources :users, only: [:index, :show, :edit, :update]
  resources :ordered_products, only: [:update]
  resources :products, except: [:destroy]
  resources :genres, except: [:destroy]
  get 'searches' => "searches"
 end

end