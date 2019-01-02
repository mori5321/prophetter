Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "home#index"
  get '/auth/:provider/callback', to: "sessions#create"
  get '/logout', to: "sessions#destroy"

  resources :prophets, only: [:index, :new, :create, :destroy, :show]
  resources :details, only: :index

  get 'images/ogp.png', to: 'images#ogp', as: 'images_ogp'
end
