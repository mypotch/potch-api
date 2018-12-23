json.partial! 'partial/paginate_meta', object: @posts
json.items @posts do |post|
  json.(post, :pid, :title, :desc, :created_time, :updated_time)
  json.partial! 'partial/attachment', object: post, key: :icon
end

if @category.present?
  p @category.ancestors.inspect
  json.category_with_parents @category.ancestors.select([:id, :name]).to_a.push({id: @category.id, name: @category.name}) do |category|
    json.(category, :id, :name)
  end
end