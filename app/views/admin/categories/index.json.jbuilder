json.partial! 'partial/paginate_meta', object: @categories
json.items @categories do |category|
  json.(category, :id, :name, :created_time, :updated_time)
end