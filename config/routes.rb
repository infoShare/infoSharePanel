Rails.application.routes.draw do
  get 'sessions/login'
  get 'sessions/home'
  get 'sessions/logout'

  post 'sessions/login_attempt'

  root 'sessions#login'
end
