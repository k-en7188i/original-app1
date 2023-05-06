Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'posts#index'
  resources :posts, only: [:index, :new, :create, :destroy, :show, :edit, :update] do
    resource :likes, only: [:create, :destroy]
    collection do
      get 'search'
    end
  end


  resources :users, only: :show
end
