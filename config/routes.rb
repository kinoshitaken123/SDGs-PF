Rails.application.routes.draw do

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
  sessions: 'users/sessions'
}

devise_for :admins, controllers: {
  sessions: 'admins/sessions'
}

  root to: 'public/products#top'

  namespace :public do
   resources 'rooms', only: [:index, :show]
   resources 'products', only: [:index, :show, :top, :about]
   resources 'payment_cards', only: [:new, :create, :index, :destroy]
   resources 'orders', only: [:index, :show, :new, :create]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
