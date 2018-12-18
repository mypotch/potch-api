json.partial! 'partial/paginate_meta', object: @posts
json.items @posts do |post|
  json.(post, :pid, :title, :created_time, :updated_time)
end