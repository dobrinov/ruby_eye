Rails.application.routes.draw do
  # Index
  get 'index', to: 'indexes#show'

  # Hosts
  get 'hosts',           to: 'hosts#index'
  get 'hosts/:hostname', to: 'hosts#show', hostname: /([a-zA-Z0-9\-_]*.?)+/, as: 'host'

  # Services
  get 'services', to: 'services#index'

  # Applications
  get 'applications', to: 'applications#index'

  namespace :alerting do
    # Policies
    get 'policies', to: 'policies#index'

    # Incidents
    get 'incidents', to: 'incidents#index'
  end

  root to: 'static_pages#dashboard'
end
