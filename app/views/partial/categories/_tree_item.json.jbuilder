json.(object, :id, :name)
if object.children.present?
  json.children object.children do |category|
    json.partial! 'partial/categories/tree_item', object: category
  end
end