Shortr::Application.routes.draw do
  root 'links#new'
  get '/:short_url', to: 'links#url_redirect'

  namespace :api, defaults: { format: 'json' } do
    resources :links, only: [:create]
  end
end
