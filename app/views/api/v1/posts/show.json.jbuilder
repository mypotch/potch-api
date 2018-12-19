json.item do
  json.(@post, :pid, :title, :desc, :content, :created_time)
  json.partial! 'partial/attachment', object: @post, key: :icon
end
