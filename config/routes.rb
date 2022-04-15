Rails.application.routes.draw do
  devise_for :users
  root to: 'source#index'
  get 'source/about'
  get 'source/index'
  get 'source/saved'
  root to: "home#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
