class Admin::CategoriesController < Admin::BaseController
  def index_roots
    categories = Category.roots.order(position: :asc)
    br_index categories
  end

  def update_position
    br_show do |category|
      if params[:parent_id].present? && params[:parent_id] != category.parent_id
        category.remove_from_list
        category.update parent_id: params[:parent_id]
      end
      category.insert_at params[:position]
    end
  end

  def increment_position
    br_show do |category|
      category.increment_position
    end
  end

  def decrement_position
    br_show do |category|
      category.decrement_position
    end
  end
end
