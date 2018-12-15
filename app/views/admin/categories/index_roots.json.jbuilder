json.partial! 'partial/paginate_meta', object: @categories
json.items @categories do |category|
  def render_category category, json
    json.(category, :id, :name, :enabled, :category, :recommended, :position, :created_time, :updated_time)
    json.children category.children.order(position: :asc) do |category|
      render_category category, json
    end
  end
  render_category category, json
end