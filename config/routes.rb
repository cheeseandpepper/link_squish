Rails.application.routes.draw do
  root 'links#new'
  resources :links

  scope :s do
    get 'not_found', to: 'short_urls#not_found',  as: 'not_found'
    get ':id',       to: 'short_urls#show',      as: 'short_url'
  end
end
