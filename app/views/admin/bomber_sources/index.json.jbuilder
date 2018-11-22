json.partial! 'partial/paginate_meta', object: @bomber_sources
json.items @bomber_sources do |bomber_source|
  json.(bomber_source, :id, :title, :url, :method, :headers, :params, :data, :result, :created_time, :updated_time)
end