json.partial! 'partial/paginate_meta', object: @posts
json.items @posts do |post|
  json.(post, :pid, :title, :desc, :created_time, :updated_time)
  json.partial! 'partial/attachment', object: post, key: :icon
end