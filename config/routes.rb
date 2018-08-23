Rails.application.routes.draw do
  devise_for :users, :controllers => { :registrations => "user/registrations" }
  resources :users
  get 'join_team/:id', to: 'users#join_team', as: 'join_team'
  get 'join_department/:id', to: 'users#join_department', as: 'join_department'
  post 'add_exercise', to: 'users#add_exercise'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'welcome#index'
  resources :teams, :challenges
  resources :departments, except: [:index]

  get 'search_teams', to: 'teams#search'
end
