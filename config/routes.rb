Rails.application.routes.draw do


 devise_for :user,controllers: {
   sessions: 'user/sessions',
   passwords: 'user/passwords',
   registrations: 'user/registrations'
 }

 devise_for :admins, controllers: {
   sessions: 'admins/sessions',
   passwords:     'admins/passwords',
   registrations: 'admins/registrations'
 }
  namespace :public do
     get 'chats/create'
   end

   namespace :public do
     get 'favorites/destroy'
     get 'favorites/create'
   end

   root to: 'public/products#top'
   get 'products/about'

   namespace :public do
    resources 'rooms', only: [:index, :show, :create]
    resources 'products', only: [:index, :show, :top] do
      collection do
        get 'about'
        resources 'comments', only: [:create, :destroy]
      end
    end
    resources 'payment_cards', only: [:new, :create, :index, :destroy]
    resources 'orders', only: [:index, :show, :new, :create]
    resources 'cart_items', only: [:index,:update,:create,:destroy]
    post 'chat/:id' => 'chats#show', as: 'chat'
   end

  namespace :admin do
    resources 'rooms', only: [:index, :show]
    resource 'chats' , only: [:create]
    resources 'orders', only: [:show, :update]do
      member do
      get :costomer_top
      get :top
    end
  end
    resources 'ordered_products', only: [:update]
    resources 'users', only: [:index, :show, :edit, :update]
    resources 'products', only: [:create, :new, :index, :edit, :update, :show]
    resources 'genres', only: [:create, :new, :index, :edit, :update]
  end
end
