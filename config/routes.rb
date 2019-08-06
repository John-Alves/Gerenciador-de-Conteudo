Rails.application.routes.draw do
  root to: 'questions#index'

  get 'sessions/new'

  resources :users
  resources :questions
  resources :question_types
  resources :subjects

  get    'sign_in'   => 'sessions#new'
  post   'sign_in'   => 'sessions#create'
  delete 'sign_out'  => 'sessions#destroy'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
