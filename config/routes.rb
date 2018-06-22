Rails.application.routes.draw do
  resources :rules
  root 'consultations#index'
  resources :indications
  resources :troubles
  resources :consultations, only: [:index]
  
  post "/calculate_result", to: "consultations#calculate_result"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
