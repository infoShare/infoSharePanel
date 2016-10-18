Rails.application.routes.draw do
  get 'sessions/login'
  get 'sessions/home'
  get 'sessions/logout'

  post 'sessions/accept'
  post 'sessions/reject'
  post 'sessions/activateUser'
  post 'sessions/blockUser'
  post 'sessions/deleteUser'
  post 'sessions/deleteCategory'
  post 'sessions/deleteInformation'
  post 'sessions/makePublic'
  post 'sessions/makePrivate'
  post 'sessions/login_attempt'

  root 'sessions#login'
end
