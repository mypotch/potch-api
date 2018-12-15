class Admin::PostsController < Admin::BaseController
  def create
    params[:author] = current_admin
    super
  end
end
