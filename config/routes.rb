Rails.application.routes.draw do
  resources :messages
  root 'messages#index'
  get 'rabin', to: 'messages#rabin'
  get 'crush', to: 'messages#crush'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
  mount ActionCable.server => '/cable'
  
end
