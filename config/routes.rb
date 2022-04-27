Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }

  get 'articles/template_new', to: 'articles#template_new', as: 'template_new_articles'
  get 'articles/activities/:type', to: 'articles#activities', as: 'article_activities'
  resources :articles do
    resources :comments
  end

  resources :authors do
    patch 'verify', to: 'authors#verify', as: 'verify'
  end

  root to: 'articles#index'
end
