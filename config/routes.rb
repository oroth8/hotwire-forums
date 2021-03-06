# frozen_string_literal: true

Rails.application.routes.draw do
  resources :categories
  devise_for :users
  root to: 'main#index'
  resources :discussions, only: %i[index show new create edit update destroy] do
    resources :posts, only: %i[create show edit update destroy], module: :discussions

    collection do
      get 'category/:id', to: 'categories/discussions#index', as: :category
    end
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
