Rails.application.routes.draw do
  root to: 'source#index'
  get 'source/home'
  get 'source/about'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
