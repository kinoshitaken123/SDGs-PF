Rails.application.routes.draw do
  namespace :public do
    get 'products/top'
    get 'products/about'
    get 'products/show'
    get 'products/index'
  end
  root to: 'public/products#top'

  namespace :public do
    get 'products/top'
    get 'products/about'
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
