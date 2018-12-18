class Api::V1::PostsController < Api::V1::BaseController
  before_action :set_category, only: [:index]

  def index
    super @category.subtree_posts
  end

  def show
    @post = Post.find_by(pid: params[:pid])
  end

  private

  def set_category
    @category = Category.find(params[:category_id])
  end
end
