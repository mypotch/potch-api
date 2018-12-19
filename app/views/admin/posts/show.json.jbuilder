json.item do
  json.(@post, :id, :title, :desc, :content, :category_ids, :created_at)
  json.partial! 'partial/attachment', object: @post, key: :icon
end