Rails.application.routes.draw do
  devise_for :users
  root "pages#home"

  resources :locations, only: [:index, :show, :new, :create, :edit, :update, :destroy] do
    resources :reviews, only: [:create, :update, :destroy], shallow: true
    member do
      post   :favorite    # /locations/:id/favorite
      delete :unfavorite  # /locations/:id/unfavorite
    end
  end
  resources :favorites, only: [:index, :destroy, :create]
  get "profile", to: "users#profile", as: :profile

end
