# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
# defaults format: :json do
#   resources :anyname
# end
defaults format: :json do
  namespace :api do
    namespace :v1 do
      resources :home, only: [:index]
      resources :categories, only: [:show] do
        get :index_roots, on: :collection
        resources :posts, param: :pid
      end
    end
  end
end
