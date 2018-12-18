json.items @categories do |category|
  json.(category, :id, :name)
end