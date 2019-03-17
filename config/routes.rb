Rails.application.routes.draw do
  resources :links
  root 'links#new'
end
