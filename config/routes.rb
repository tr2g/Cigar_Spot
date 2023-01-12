Rails.application.routes.draw do

  # レビュアー用ルーティング
  devise_for :reviewers, skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }

  scope module: :public do
    root to: 'homes#top'
    get '/about' => 'homes#about'
    get 'reviewers/my_page' => 'reviewers#show'
    get 'reviewers/information/edit' => 'reviewers#edit'
    patch 'reviewers/information' => 'reviewers#update'
    get 'reviewers/unsubscribe' => 'reviewers#unsubscribe'
    patch 'reviewers/withdrawal' => 'reviewers#withdrawal'

    resources :reviewers
    resources :shops
    resources :sessions
    resources :registrations
    resources :comments
  end

  #ゲストログイン用ルーティング
  devise_scope :reviewers do
    post 'reviewers/guest_sign_in', to: 'public/sessions#guest_sign_in'
  end

  # 管理者用ルーティング
  devise_for :admin, skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }

  namespace :admin do
    root to: 'homes#top'
    resources :genres
    resources :reviewers
    resources :shops
    resources :comments
    resources :sessions
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end