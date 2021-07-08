Rails.application.routes.draw do

  namespace :admin do
    get 'rooms/index'
    get 'rooms/show'
  end
  namespace :admin do
    get 'chats/create'
  end
  namespace :admin do
    get 'orders/top'
    get 'orders/customer_top'
    get 'orders/show'
    get 'orders/update'
  end
  namespace :admin do
    get 'ordered_products/update'
  end
  namespace :admin do
    get 'users/index'
    get 'users/show'
    get 'users/edit'
    get 'users/update'
  end
  namespace :admin do
    get 'searches/searches'
  end
  namespace :admin do
    get 'products/create'
    get 'products/new'
    get 'products/index'
    get 'products/edit'
    get 'products/update'
  end
  namespace :admin do
    get 'genres/create'
    get 'genres/index'
    get 'genres/edit'
    get 'genres/update'
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
   namespace :public do
     get 'chats/create'
   end

   namespace :public do
     get 'comments/destroy'
     get 'comments/create'
   end

   namespace :public do
     get 'favorites/destroy'
     get 'favorites/create'
   end

 devise_for :users,controllers: {
   sessions: 'users/sessions',
   passwords:     'users/passwords',
   registrations: 'users/registrations'
 }

 devise_for :admins, controllers: {
   sessions: 'admins/sessions',
   passwords:     'admins/passwords',
   registrations: 'admins/registrations'
 }

   root to: 'public/products#top'
   get 'products/about'

   namespace :public do
    resources 'rooms', only: [:index, :show]
    resources 'products', only: [:index, :show, :top]
    resources 'payment_cards', only: [:new, :create, :index, :destroy]
    resources 'orders', only: [:index, :show, :new, :create]
    resources 'cart_items', only: [:index,:update,:create,:destroy]
   end


end
