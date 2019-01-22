# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
# defaults format: :json do
#   resources :anyname
# end
defaults format: :json do
  constraints subdomain: /\Aapi/ do
    # namespace :api do
    scope module: 'api' do
      namespace :v1 do
        resources :home, only: [:index]
        resources :categories, only: [:show] do
          get :index_roots, on: :collection
          resources :posts, param: :pid
        end
        resources :ui_part_version_files, param: :fid, only: [:show]
      end
    end
  end
end