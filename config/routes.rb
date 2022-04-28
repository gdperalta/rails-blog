Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }

  get 'articles/template_new', to: 'articles#template_new', as: 'template_new_articles'
  get 'articles/activities/:type', to: 'articles#activities', as: 'article_activities'
  get 'articles/owned', to: 'articles#owned', as: 'articles_owned'
  resources :articles do
    resources :comments
  end

  resources :authors do
    patch 'verify', to: 'authors#verify', as: 'verify'
  end

  scope module: 'api/v1', path: '', as: '' do
    get 'activity/random', to: 'activity#random_activity', as: 'activity_random'
    get 'activity/:type', to: 'activity#activity_type', as: 'activity_type'
    get 'products/:id', to: 'products#product', as: 'product'
  end

  root to: 'articles#index'
end
