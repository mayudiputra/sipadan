Rails.application.routes.draw do
  resources :rules
  resources :indications
  resources :troubles
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
