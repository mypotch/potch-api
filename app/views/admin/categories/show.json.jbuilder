json.item do
  json.(@category, :id, :name, :enabled, :recommended, :category, :created_at)
  json.partial! 'partial/attachment', object: @category, key: :icon
end