json.partial! 'partial/paginate_meta', object: @ui_parts
json.items @ui_parts do |part|
  json.(part, :id, :pid, :name, :desc, :devices, :units, :permission, :created_time, :updated_time)
  json.category_name_with_parents part.category.try(:name_with_parents)
end