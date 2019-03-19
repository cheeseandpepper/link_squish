Rails.application.routes.draw do
  root 'links#new'
  resources :links
  
  get 'confirmation', to: 'confirmation#index', as: 'confirmation'
  
  scope :x do
    get ':id', to: 'tokens#edit', as: 'edit_token'
  end

  scope :s do
    get 'not_found',    to: 'short_urls#not_found',       as: 'not_found'
    get ':id',          to: 'short_urls#show',            as: 'short_url'
  end
end
