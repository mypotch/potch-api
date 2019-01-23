class ApplicationController < ActionController::API
  include DeviseTokenAuth::Concerns::SetUserByToken
  include BaseResource
end
