Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'posts#index'
  resources :posts, only: [:index, :new, :create, :destroy, :show, :edit, :update] do
    resources :favorites, only: [:create, :destroy]
    resources :comments, only: [:create, :destroy]
    resource :likes, only: [:create, :destroy]
    collection do
      get 'search'
    end
    collection do
      get 'ranking'
    end
    
    
    # 既読機能
    # get 'checks/:id', to: 'checks#check', as: 'check'
    # get 'checks/revert/:id', to: 'checks#revert_check'
    # get 'check_read/:user_id/:article_id', to: 'articles#check_read', as: 'check_read'
    
  end
  resources :users, only: :show do
    member do
      get :favorites
    end
    # フォロー機能
   
    resource :relationships, only: [:create, :destroy]
  
  end
  
  
  
end
