# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
# defaults format: :json do
#   constraints subdomain: /\Aapa/ do
#     scope module: 'admin' do
#       resource :profile
#     end
#   end
# end
defaults format: :json do
  constraints subdomain: /\Aapa/ do
    mount_devise_token_auth_for 'Admin', at: 'admin_auth'
    # namespace :admin do
    scope module: 'admin' do
      resources :bomber_sources

      resources :ui_parts do
        resources :ui_part_versions
      end

      namespace :ui do
        resources :ui_parts do
          resources :ui_part_versions
        end
      end

      resources :categories do
        get :index_roots, :category_types, on: :collection
        put :toggle_switch, :update_position, :increment_position, :decrement_position, on: :member
      end
      resources :posts
    end
  end
end
