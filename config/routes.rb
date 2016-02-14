Rails.application.routes.draw do
  get 'hosts',           to: 'hosts#index'
  get 'hosts/:hostname', to: 'hosts#show', hostname: /([a-zA-Z0-9-_]*.?)+/, as: 'host'

  root to: 'static_pages#dashboard'
end
