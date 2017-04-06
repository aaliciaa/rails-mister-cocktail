Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
# GET all cocktails routes and
# GET "cocktails/42/doses/new"

root to: 'cocktails#index'

resources :doses, only: [:destroy]
resources :cocktails

resources :cocktails do
  resources :doses, only: [:create, :new]
end

end
