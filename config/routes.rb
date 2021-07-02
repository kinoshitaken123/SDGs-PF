Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  devise_for :admins, :controllers => {
    :sessions => 'admins/sessions'
  }

  devise_for :cusomers, :controllers => {
    :sessions => 'customers/sessions',
    :registrations => "cusomers/registrations"
  }

end
