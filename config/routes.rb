Adoptajerry::Application.routes.draw do
  use_doorkeeper
  mount API::Base => '/api'
  constraints CanAccessAPIDocumentation do
    mount GrapeSwaggerRails::Engine => '/api-doc'
  end

  root 'jerries#index'

  get "/build" => 'pages#start'
  get '/auth/:provider/callback' => 'sessions#create'
  get '/signout' => 'sessions#destroy'
  get 'makers/profile' => 'makers#edit', as: :edit_profile
  patch 'makers/profile' => 'makers#update', as: :profile
  get 'makers/:id' => 'makers#show', as: :maker
  get 'jerries/roulette' => 'jerries#roulette', as: :jerry_roulette
  get 'jerries/:id/team/edit' => 'jerries#edit_team', as: :edit_team

  resources :jerries do
    resources :organs
  end

  resources :locales, controller: :translations, only: :show
end
