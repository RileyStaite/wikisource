Rails.application.routes.draw do
  devise_for :users
  root to: 'source#index'
  get 'source/about'
  get 'source/index'
  get 'source/saved'
  post 'source/download' => 'source#download'
  post 'source/delete' => 'source#delete'
  post 'source/saved'

  post "source/:save", to: "source#saved", as: "saved"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
