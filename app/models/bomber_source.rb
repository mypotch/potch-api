class BomberSource < ApplicationRecord
  serialize :headers, JSON
  serialize :params, JSON
  serialize :data, JSON
  serialize :result, JSON

  enum method: { method_get: 0, method_post: 1 }
  ransacker :method, formatter: proc { |v| methods[v] }
end
