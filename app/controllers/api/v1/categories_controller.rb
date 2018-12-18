class Api::V1::CategoriesController < Api::V1::BaseController
  def index_roots
    categories = Category.roots.order(position: :asc)
    br_index categories
  end
end
