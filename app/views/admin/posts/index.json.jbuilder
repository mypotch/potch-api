json.partial! 'partial/paginate_meta', object: @posts
json.items @posts do |post|
  json.(post, :id, :title, :created_time, :updated_time)
  json.category_names post.categories.map {|category| category.name_with_parents}
  json.author do
    json.author_type post.author_type
    json.author_id post.author_id
    json.nickname post.author.nickname
  end
end