Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :gyms, only: [:index, :show, :create, :update, :destroy]
  resources :memberships, only: [:index, :show, :update, :create, :destroy]
  resources :clients, only: [:index, :show, :create, :update, :destroy]

end
