class Api::V1::HomeController < Api::V1::BaseController
  def index
    @category_roots = Category.roots.order(position: :asc)
  end
end
