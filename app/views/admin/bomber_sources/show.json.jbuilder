json.item do
  json.(@bomber_source, :id, :title, :url, :method)
  json.headers @bomber_source.headers.to_json
  json.params @bomber_source.params.to_json
  json.data @bomber_source.data.to_json
  json.result @bomber_source.result.to_json
end