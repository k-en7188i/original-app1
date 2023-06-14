Rails.application.routes.draw do
  
  devise_for :users
  # パスワードの可視化 準備
  # devise_for :users, controllers: { sessions: 'users/sessions' }

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'posts#index'
  resources :posts, only: [:index, :new, :create, :destroy, :show, :edit, :update] do
    resources :favorites, only: [:create, :destroy]
    resources :comments, only: [:create, :destroy]
    resource :likes, only: [:create, :destroy]
    resources :reviews, only: [:index, :create, :show] #レビュー機能
    collection do
      get 'search'
    end
    collection do
      get 'ranking'
    end
    
    
    # 既読機能
    resources :checks, only: [:create, :destroy]
    
    # get 'checks/:id', to: 'checks#check', as: 'check'
    get 'checks/revert/:id', to: 'checks#revert_check'
    get 'check_read/:user_id/:article_id', to: 'articles#check_read', as: 'check_read'


  end
  
  resources :users, only: :show do
    #お気に入り機能
    # resource :favorites, only: [:create, :destroy]
    # member do
    #   get :favorites
    # end
    get :favorites, on: :member

    # フォロー機能
   
    resource :relationships, only: [:create, :destroy]
  
  end
  
  
end
