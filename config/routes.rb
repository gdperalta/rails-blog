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

  scope module: 'api/v1', path: 'activity', as: 'activity' do
    get '/random', to: 'activity#random_activity', as: 'random'
    get '/:type', to: 'activity#activity_type', as: 'type'
  end

  root to: 'articles#index'
end
