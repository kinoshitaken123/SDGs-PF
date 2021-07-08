Rails.application.routes.draw do

  devise_for :users
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

 #devise_for :users,controllers: {
   #sessions: 'users/sessions'
 #}

 devise_for :admins, controllers: {
   sessions: 'admins/sessions'
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

  namespace :admin do
   resources :products, except: [:destroy]
   resources :genres, except: [:destroy]
   get 'searches' => "searches"
   resources :rooms, only: [:index, :show]
   resource :charts, only: [:create]
   resources :rooms, only: [:index, :show]
   resource :chats, :only => [:create]
  end
end
