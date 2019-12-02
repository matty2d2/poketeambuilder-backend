Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get '/stealdata', to: 'pokemon#stealdata'
  get '/pokemon', to: 'pokemon#index'

  post '/signin', to: 'users#signin'
  post '/create', to: 'users#createuser'
  get '/validate', to: 'users#validate'
  get '/user-teams', to: 'users#userteams'

  post '/make-team', to: 'teams#maketeam'
  delete '/delete-team', to: 'teams#deleteteam'
  patch '/update-team', to: 'teams#updateteam'
end
