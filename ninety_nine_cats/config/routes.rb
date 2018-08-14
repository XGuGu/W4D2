Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :cats, only: [:index, :create, :destroy, :show, :edit, :new, :update] do
    resources :cat_rental_requests, only: [:index]
  end 

  resources :cat_rental_requests, only: [:index, :new, :create]


end
