# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
# defaults format: :json do
#   constraints subdomain: /\Aapa/ do
#     scope module: 'admin' do
#       resource :profile
#     end
#   end
# end
defaults format: :json do
  mount_devise_token_auth_for 'Admin', at: 'admin_auth'
  namespace :admin do
    resources :bomber_sources
    resources :categories do
      get :index_roots, on: :collection
      put :toggle_switch, :update_position, :increment_position, :decrement_position, on: :member
    end
  end
end
