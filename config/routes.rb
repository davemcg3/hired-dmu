Rails.application.routes.draw do
  resources :portfolios
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "portfolios#index"
end
