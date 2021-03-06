Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "home#index"
  get '/auth/:provider/callback', to: "sessions#create"
  get '/logout', to: "sessions#destroy"

  resources :prophets, only: [:index, :new, :create, :destroy, :show]

  get 'ogp_images/ogp.png', to: 'ogp_images#ogp'
end
