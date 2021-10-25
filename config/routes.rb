Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :users
      resources :groups
      resources :group_members
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
