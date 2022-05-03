Rails.application.routes.draw do
  devise_for :users
  root to: 'source#index'
  get 'source/about'
  get 'source/index'
  get 'source/saved'
  post 'source/download' => 'source#download'
  post 'source/saved'
  delete "source/delete", to: "source#delete", as: "delete"

  post "source/:saved", to: "source#saved", as: "save"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
