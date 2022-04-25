Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get 'articles/template_new', to: 'articles#template_new', as: 'template_new_articles'
  get 'articles/activities', to: 'articles#activities', as: 'article_activities'
  resources :articles do
    resources :comments
  end

  resources :authors do
    patch 'verify', to: 'authors#verify', as: 'verify'
  end

  # get 'authors', to: 'authors#index', as: 'authors'
  # post 'authors', to: 'authors#create'
  # get 'authors/new', to: 'authors#new', as: 'new_authors'
  # get 'authors/:id', to: 'authors#show', as: 'author'
  # get 'authors/:id/edit', to: 'authors#edit', as: 'edit_author'
  # patch 'authors/:id', to: 'authors#update'
  # patch 'authors/verify/:id', to: 'authors#verify', as: 'verify_author'
  # delete 'authors/:id', to: 'authors#destroy'

  root to: 'articles#index'
end
