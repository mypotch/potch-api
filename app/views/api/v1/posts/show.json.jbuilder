json.item do
  json.(@post, :pid, :title, :desc, :content, :created_time)
  json.partial! 'partial/attachment', object: @post, key: :icon
  json.partial! 'partial/counter', object: @post.counter
end
