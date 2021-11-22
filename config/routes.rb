Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :messages
      resources :users
      resources :groups
      resources :group_members
      resources :statuses
      # think about :status and whether it should be nested
      # also think about whether :group_members should be nested
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
